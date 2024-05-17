// Copyright © 2022 Brian Dewey, 2024 Ky Leggiero. Available under the MIT License, see LICENSE for details.

import Foundation

/// Thrown when two branches conflict.
public struct ConflictError: Error, LocalizedError, Sendable {
  public let conflictingPaths: [String]

  public var errorDescription: String? {
    conflictingPaths.count == 1
      ? "Conflicting file: \(conflictingPaths[0])"
      : "Conflicting files: \(conflictingPaths.joined(separator: ", "))"
  }
}
