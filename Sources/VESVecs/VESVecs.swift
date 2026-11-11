import Foundation

/// Vec2d is a struct used to represent a 2 dimensional vector with an x and a y component \
/// You can do normal arithmetic operations on the struct such as +, -, \*, /

public struct Vec2d {
    /// The x component of the vector
    public var x: Double
    /// The y component of the vector
    public var y: Double
    
    /// The **length** component of the vector \
    /// In reality this is a computed property that uses **``sqrtl``** and two **``powl``** functions, so it is quite slow \
    /// If this field is **``set``**, it simply normalises itself until its **length** is the same as the new value
    public var length: Double {
        get { sqrtl(powl(x, 2) + powl(y, 2)) }
        set(new_len) { self = self.normal * new_len }
    }
    
    /// The normal of the vector \
    /// By dividing itself by its own length it returns the normalised vector of itself \
    /// Can be used in the context where you need to find out the length of a vector when projected onto another vector as if it were a plane \
    /// Is in fact a computed property and should therefore be used sparingly as it accesses **``self.length``** which is also a computed property
    /// ```swift
    /// let vec = Vec2d(x: 3, y: 4)
    /// let plane = Vec2d(x: 0, y: 5)
    /// let projected_length = a * b.normal
    /// ```
    /// **``c``** equals **``4``** as if **``a``** was pojected onto the y plane (**``b``**) it would be **``4``** long
    public var normal: Vec2d {
        self / self.length
    }
    
    public init<T: BinaryFloatingPoint>(x: T, y: T) {
        self.x = Double(x)
        self.y = Double(y)
    }
    public init<T: BinaryFloatingPoint>(_ x: T, _ y: T) {
        self.x = Double(x)
        self.y = Double(y)
    }
    public init<T: BinaryInteger>(x: T, y: T) {
        self.x = Double(x)
        self.y = Double(y)
    }
    public init<T: BinaryInteger>(_ x: T, _ y: T) {
        self.x = Double(x)
        self.y = Double(y)
    }
    public init<T: BinaryFloatingPoint>(from val: (x: T, y: T)) {
        self.x = Double(val.x)
        self.y = Double(val.y)
    }
    public init<T: BinaryInteger>(from val: (x: T, y: T)) {
        self.x = Double(val.x)
        self.y = Double(val.y)
    }
    public init<T: BinaryFloatingPoint>(_ val: (x: T, y: T)) {
        self.x = Double(val.x)
        self.y = Double(val.y)
    }
    public init<T: BinaryInteger>(_ val: (x: T, y: T)) {
        self.x = Double(val.x)
        self.y = Double(val.y)
    }
    public init<T: BinaryFloatingPoint, U: BinaryInteger>(from val: (x: T, y: U)) {
        self.x = Double(val.x)
        self.y = Double(val.y)
    }
    public init<T: BinaryInteger, U: BinaryFloatingPoint>(from val: (x: T, y: U)) {
        self.x = Double(val.x)
        self.y = Double(val.y)
    }
    public init<T: BinaryFloatingPoint, U: BinaryInteger>(_ val: (x: T, y: U)) {
        self.x = Double(val.x)
        self.y = Double(val.y)
    }
    public init<T: BinaryInteger, U: BinaryFloatingPoint>(_ val: (x: T, y: U)) {
        self.x = Double(val.x)
        self.y = Double(val.y)
    }
    public init(from val: CGVector) {
        self.x = val.dx
        self.y = val.dy
    }
    public init(_ val: CGVector) {
        self.x = val.dx
        self.y = val.dy
    }
    
    
    public static func + (lhs: Vec2d, rhs: Vec2d) -> Vec2d {
        Vec2d(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    public static func - (lhs: Vec2d, rhs: Vec2d) -> Vec2d {
        Vec2d(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    public static func * (lhs: Vec2d, rhs: Vec2d) -> Double {
        lhs.x * rhs.x + lhs.y * rhs.y
    }
    public static func *<T: BinaryFloatingPoint> (lhs: Vec2d, rhs: Vec2d) -> T {
        T(lhs.x * rhs.x + lhs.y * rhs.y)
    }
    
    public static func *<T: BinaryFloatingPoint> (lhs: Vec2d, rhs: T) -> Vec2d {
        Vec2d(x: lhs.x * Double(rhs), y: lhs.y * Double(rhs))
    }
    
    public static func *<T: BinaryFloatingPoint> (lhs: T, rhs: Vec2d) -> Vec2d {
        Vec2d(x: rhs.x * Double(lhs), y: rhs.y * Double(lhs))
    }
    
    public static func *<T: BinaryInteger> (lhs: Vec2d, rhs: T) -> Vec2d {
        Vec2d(x: lhs.x * Double(rhs), y: lhs.y * Double(rhs))
    }
    
    public static func *<T: BinaryInteger> (lhs: T, rhs: Vec2d) -> Vec2d {
        Vec2d(x: rhs.x * Double(lhs), y: rhs.y * Double(lhs))
    }
    
    public static func /<T: BinaryFloatingPoint> (lhs: Vec2d, rhs: T) -> Vec2d {
        Vec2d(x: lhs.x / Double(rhs), y: lhs.y / Double(rhs))
    }
    
    public static func /<T: BinaryFloatingPoint> (lhs: T, rhs: Vec2d) -> Vec2d {
        Vec2d(x: rhs.x / Double(lhs), y: rhs.y / Double(lhs))
    }
    
    public static func /<T: BinaryInteger> (lhs: Vec2d, rhs: T) -> Vec2d {
        Vec2d(x: lhs.x / Double(rhs), y: lhs.y / Double(rhs))
    }
    
    public static func /<T: BinaryInteger> (lhs: T, rhs: Vec2d) -> Vec2d {
        Vec2d(x: rhs.x / Double(lhs), y: rhs.y / Double(lhs))
    }
    
    public static func += (lhs: inout Vec2d, rhs: Vec2d) {
        lhs = lhs + rhs
    }
    
    public static func -= (lhs: inout Vec2d, rhs: Vec2d) {
        lhs = lhs - rhs
    }
    
    public static func *=<T: BinaryFloatingPoint> (lhs: inout Vec2d, rhs: T) {
        lhs = lhs * rhs
    }
    
    public static func *=<T: BinaryInteger> (lhs: inout Vec2d, rhs: T) {
        lhs = lhs * rhs
    }
    
    public static func == (lhs: Vec2d, rhs: Vec2d) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y
    }
    
    public static func != (lhs: Vec2d, rhs: Vec2d) -> Bool {
        lhs.x != rhs.x || lhs.y != rhs.y
    }
    
    /// Calculates the distance between the two vectors as if they are pointing to coordinates on a 2 dimensional plane
    public static func distance (_ lhs: Vec2d, _ rhs: Vec2d) -> Double {
        (lhs - rhs).length
    }
    /// Calculates the distance between the two vectors as if they are pointing to coordinates on a 2 dimensional plane
    public static func distance<T: BinaryFloatingPoint> (_ lhs: Vec2d, _ rhs: Vec2d) -> T {
        T((lhs - rhs).length)
    }
    
    /// Calculates the distance between the two vectors as if they are pointing to coordinates on a 2 dimensional plane
    public func distance (_ rhs: Vec2d) -> Double {
        (self - rhs).length
    }
    /// Calculates the distance between the two vectors as if they are pointing to coordinates on a 2 dimensional plane
    public func distance<T: BinaryFloatingPoint> (_ rhs: Vec2d) -> T {
        T((self - rhs).length)
    }
}

