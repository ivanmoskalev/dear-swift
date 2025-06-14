// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// DearSwift.swift
// Part of the dear suite <https://github.com/ivanmoskalev/dear>.
// This code is released into the public domain under The Unlicense.
// For details, see <https://unlicense.org/>.
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/// A namespace-like enumeration that encapsulates utility functions and types provided by the Dear module.
public enum Dear {
}

/// An error type used by the Dear module to signal unexpected conditions, such as unwrapping a nil optional.
public enum DearError: Error {
    /// Indicates that a nil value was encountered when a non-nil was expected.
    case unexpectedNil
}

// MARK: - Dear.Optionals

public extension Dear {
    /// Unwraps an optional value, or throws `DearError.unexpectedNil` if the value is `nil`.
    ///
    /// - Parameter value: The optional value to unwrap.
    /// - Returns: The unwrapped non-optional value.
    /// - Throws: `DearError.unexpectedNil` if the value is `nil`.
    @inlinable static func unwrap<T>(_ value: T?) throws -> T {
        guard let value else { throw DearError.unexpectedNil }
        return value
    }
}

// MARK: - Dear.Debug

public extension Dear {
    /// Prints the value and its call site (file and line) to the debug console when compiled in Debug mode.
    ///
    /// In Release mode, this function has no side effects and simply returns the value.
    ///
    /// - Parameters:
    ///   - value: The value to be printed and returned.
    ///   - file: The source file name where the function is called. Defaults to the current file.
    ///   - line: The line number where the function is called. Defaults to the current line.
    /// - Returns: The same `value` passed as input.
    @inlinable static func dbg<T>(_ value: T, file: StaticString = #file, line: Int = #line) -> T {
        #if DEBUG
        debugPrint("\(file):\(line)", value)
        #endif
        return value
    }
}

// MARK: - Dear.Comparable

public extension Comparable {
    /// Returns the value clamped to the provided closed range.
    ///
    /// - Parameter range: The closed range within which to clamp the value.
    /// - Returns: The value if it lies within the range; otherwise, the nearest bound.
    @inlinable func clamped(range: ClosedRange<Self>) -> Self {
        return max(range.lowerBound, min(self, range.upperBound))
    }

    /// Returns the value clamped to a lower bound.
    ///
    /// - Parameter lowerBound: The minimum allowable value.
    /// - Returns: The value if it is greater than or equal to `lowerBound`; otherwise, `lowerBound`.
    @inlinable func clamped(lowerBound: Self) -> Self {
        return max(lowerBound, self)
    }

    /// Returns the value clamped to an upper bound.
    ///
    /// - Parameter upperBound: The maximum allowable value.
    /// - Returns: The value if it is less than or equal to `upperBound`; otherwise, `upperBound`.
    @inlinable func clamped(upperBound: Self) -> Self {
        return min(self, upperBound)
    }
}
