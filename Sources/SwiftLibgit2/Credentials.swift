// Copyright © 2022 Brian Dewey, 2024 Ky Leggiero. Available under the MIT License, see LICENSE for details.

import Clibgit2

private class Wrapper<T> {
  let value: T

  init(_ value: T) {
    self.value = value
  }
}

public enum Credentials: Sendable {
  case `default`
  case sshAgent
  case plaintext(username: String, password: String)
  case sshMemory(username: String, publicKey: String, privateKey: String, passphrase: String)
}

/// Handle the request of credentials, passing through to a wrapped block after converting the arguments.
/// Converts the result to the correct error code required by libgit2 (0 = success, 1 = rejected setting creds,
/// -1 = error)
internal func credentialsCallback(
  cred: UnsafeMutablePointer<UnsafeMutablePointer<git_cred>?>?,
  url: UnsafePointer<CChar>?,
  username: UnsafePointer<CChar>?,
  allowedOptions: UInt32,
  payload: UnsafeMutableRawPointer?
) -> Int32 {
  let result: Int32

  // Find username_from_url
  let name = username.map(String.init(cString:))

  let fetchOptions = FetchOptions.fromPointer(payload!)

  switch fetchOptions.credentials {
  case .default:
    result = git_cred_default_new(cred)
  case .sshAgent:
    result = git_cred_ssh_key_from_agent(cred, name!)
  case .plaintext(let username, let password):
    result = git_cred_userpass_plaintext_new(cred, username, password)
  case .sshMemory(let username, let publicKey, let privateKey, let passphrase):
    result = git_cred_ssh_key_memory_new(cred, username, publicKey, privateKey, passphrase)
  }

  return (result != GIT_OK.rawValue) ? -1 : 0
}
