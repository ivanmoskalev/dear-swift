// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// DearSwift.swift
// Part of the dear suite <https://github.com/ivanmoskalev/dear>.
// This code is released into the public domain under The Unlicense.
// For details, see <https://unlicense.org/>.
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

public enum Dear {
}

public enum DearError: Error {
    case unexpectedNil
}

// MARK: - Dear.Optionals

public extension Dear {
    /// Returns non-optional `value` if it is not nil.  Throws `DearError.unexpectedNil` if the `value` is nil.
    @inlinable static func unwrap<T>(_ value: T?) throws -> T {
        guard let value else { throw DearError.unexpectedNil }
        return value
    }
}

// MARK: - Dear.Debug

public extension Dear {
    /// If the module is built with debug configuration, `debugPrint`s the `value` together with callsite information (file and line) and returns `value`.
    /// In release configuration it just returns `value` (and hopefully is optmimized away entirely).
    @inlinable static func dbg<T>(_ value: T, file: StaticString = #file, line: Int = #line) -> T {
        #if DEBUG
        debugPrint("\(file):\(line)", value)
        #endif
        return value
    }
}
