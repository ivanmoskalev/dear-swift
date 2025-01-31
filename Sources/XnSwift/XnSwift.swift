// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// XnSwift.swift
// Part of the xn suite <https://github.com/ivanmoskalev/xn>.
// This code is released into the public domain under The Unlicense.
// For details, see <https://unlicense.org/>.
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

public enum Xn {
}

public enum XnError: Error {
    case unexpectedNil
}

// MARK: - Xn.Optionals

public extension Xn {
    /// Returns non-optional `value` if it is not nil.  Throws `XnError.unexpectedNil` if the `value` is nil.
    @inlinable static func unwrap<T>(_ value: T?) throws -> T {
        guard let value else { throw XnError.unexpectedNil }
        return value
    }
}

// MARK: - Xn.Debug

public extension Xn {
    /// If the module is built with debug configuration, `debugPrint`s the `value` together with callsite information (file and line) and returns `value`.
    /// In release configuration it just returns `value` (and hopefully is optmimized away entirely).
    @inlinable static func dbg<T>(_ value: T, file: StaticString = #file, line: Int = #line) -> T {
        #if DEBUG
        debugPrint("\(file):\(line)", value)
        #endif
        return value
    }
}
