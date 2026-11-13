import Foundation

let Pi = Double(3.14159265359)

/// Vec2d is a struct used to represent a 2 dimensional vector with an x and a y component \
/// You can do normal arithmetic operations on the struct such as [+], [-], [*], [/]

public struct Vec2d {
    /// The x component of the vector
    public var x: Double
    /// The y component of the vector
    public var y: Double
    
    /// The **length** component of the vector \
    /// In reality this is a computed property that uses **``sqrtl``** and two **``powl``** functions, so it is quite slow \
    /// If this field is **``set``**, it simply normalises itself until its **length** is the same as the new value
    public var length: Double {
        get { sqrtl(x * x + y * y) }
        set(new_len) { self = unit * new_len }
    }
    
    /// The normalized vector \
    /// By dividing itself by its own length it returns the normalised vector of itself \
    /// Can be used in the context where you need to find out the length of a vector when projected onto another vector as if it were a plane \
    /// Is in fact a computed property and should therefore be used sparingly as it accesses **``self.length``** which is also a computed property
    /// ```swift
    /// let vec = Vec2d(x: 3, y: 4)
    /// let plane = Vec2d(x: 0, y: 5)
    /// let projected_length = a * b.unit
    /// ```
    /// **``c``** equals **``4``** as if **``a``** was pojected onto the y plane (**``b``**) it would be **``4``** long
    public var unit: Vec2d {
        self / length
    }
    
    /// Returns the normal of a surface by rotating the direction of the [Vec2d]'s [unit] 90 degrees clockwise
    public var normal: Vec2d {
        Vec2d(x * cos(Pi/2) - y * sin(Pi/2), x * sin(Pi/2) + y * cos(Pi/2))
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
    public static func distance<T: BinaryInteger> (_ lhs: Vec2d, _ rhs: Vec2d) -> T {
        T((lhs - rhs).length)
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
    public func distance<T: BinaryInteger> (_ rhs: Vec2d) -> T {
        T((self - rhs).length)
    }
    /// Calculates the distance between the two vectors as if they are pointing to coordinates on a 2 dimensional plane
    public func distance<T: BinaryFloatingPoint> (_ rhs: Vec2d) -> T {
        T((self - rhs).length)
    }
}

/// [Matrix] is a struct used to represent a [Matrix] of values with as many dimensions as needed \
/// You can do all of the normal arithmetic operations on it such as [+], [-], [*], [/]

@available(macOS 26.0, iOS 26.0, *)
public struct Matrix<let X: Int, let Y: Int> {
    /// Holds all the matrices values
    public var matrix: [X of [Y of Double]]
    /// A all of the matrices dimensions
    public let dims: (x: Int, y: Int) = (X, Y)
    
    public init(matrix: [X of [Y of Double]]) {
        self.matrix = matrix
    }
    
    public init(_ matrix: [X of [Y of Double]]) {
        self.matrix = matrix
    }
    
    /// Initialises a matrix from a [Vec2d] where it would be vertical
    public init(from_v: Vec2d) where X == 1, Y == 2 {
        self.matrix = [[from_v.x, from_v.y]]
    }
    
    /// Initialises a matrix from a [Vec2d] where it would be horizontal
    public init(from_h: Vec2d) where X == 2, Y == 1 {
        self.matrix = [[from_h.x], [from_h.y]]
    }
    
    public init(from_v: Vec<Y>) where X == 1 {
        self.matrix = [from_v.components]
    }
    
    public init(from_h: Vec<X>) where Y == 1 {
        self.matrix = .init { i in [from_h[i]] }
    }
    
    public subscript(index: Int) -> [Y of Double] {
        get {
            matrix[index]
        }
        set(new_val) {
            matrix[index] = new_val
        }
    }
    
    public static func + (lhs: Matrix<X, Y>, rhs: Matrix<X, Y>) -> Matrix<X, Y> {
        var new_matrix: [X of [Y of Double]] = .init(repeating: .init(repeating: 0))
        
        for x in 0..<X {
        for y in 0..<Y {
            new_matrix[x][y] = lhs[x][y] + rhs[x][y]
        }}
        
        return Matrix(new_matrix)
    }
    
    public static func += (lhs: inout Matrix<X, Y>, rhs: Matrix<X, Y>) {
        lhs = lhs + rhs
    }
    
    public static func - (lhs: Matrix<X, Y>, rhs: Matrix<X, Y>) -> Matrix<X, Y> {
        var new_matrix: [X of [Y of Double]] = .init(repeating: .init(repeating: 0))
        
        for x in 0..<X {
        for y in 0..<Y {
            new_matrix[x][y] = lhs[x][y] - rhs[x][y]
        }}
        
        return Matrix(new_matrix)
    }
    
    public static func -= (lhs: inout Matrix<X, Y>, rhs: Matrix<X, Y>) {
        lhs = lhs - rhs
    }
    
    public static func *<let Z: Int> (lhs: Matrix<Z, Y>, rhs: Matrix<X, Z>) -> Matrix<X, Y> {
        var new_matrix: [X of [Y of Double]] = .init(repeating: .init(repeating: 0))
        
        for y in 0..<Y {
        for x in 0..<X {
            var sum: Double = 0
            for z in 0..<Z {
                sum += lhs[z][y] * rhs[x][z]
            }
            new_matrix[x][y] = sum
        }}
        
        return Matrix(new_matrix)
    }
    
    public static func *= (lhs: inout Matrix<X, Y>, rhs: Matrix<X, Y>) where X == Y {
        lhs = lhs * rhs
    }
    
    public static func * (lhs: Matrix<2, 2>, rhs: Vec2d) -> Vec2d {
        let vec_mat = Matrix<1, 2>(from_v: rhs)
        let new_vec = lhs * vec_mat
        return Vec2d(new_vec[0][0], vec_mat[0][1])
    }
    
    public static func * (lhs: Vec2d, rhs: Matrix<2, 2>) -> Vec2d {
        let vec_mat = Matrix<2, 1>(from_h: lhs)
        let new_vec = vec_mat * rhs
        return Vec2d(new_vec[0][0], vec_mat[1][0])
    }
    
    public static func *= (lhs: inout Vec2d, rhs: Matrix<2, 2>) {
        let vec_mat = Matrix<2, 1>(from_h: lhs)
        let new_vec = vec_mat * rhs
        lhs = Vec2d(new_vec[0][0], vec_mat[1][0])
    }
    
    public static func * (lhs: Matrix<X, Y>, rhs: Vec<Y>) -> Vec<Y> where X == Y {
        Vec<Y>(from_v: lhs * Matrix<1, Y>(from_v: rhs))
    }
    
    public static func * (lhs: Vec<X>, rhs: Matrix<X, Y>) -> Vec<X> where X == Y {
        Vec<Y>(from_h: Matrix<X, 1>(from_h: lhs) * rhs)
    }
    
    public static func *= (lhs: inout Vec<X>, rhs: Matrix<X, Y>) where X == Y {
        lhs = lhs * rhs
    }
    
    public static func *<T: BinaryInteger> (lhs: Matrix<X, Y>, rhs: T) -> Matrix<X, Y> {
        var new_matrix: [X of [Y of Double]] = .init(repeating: .init(repeating: 0))
        
        for x in 0..<X {
        for y in 0..<Y {
            new_matrix[x][y] = lhs[x][y] * Double(rhs)
        }}
        
        return Matrix(new_matrix)
    }
    
    public static func *=<T: BinaryInteger> (lhs: inout Matrix<X, Y>, rhs: T) {
        lhs = lhs * rhs
    }
    
    public static func *<T: BinaryFloatingPoint> (lhs: Matrix<X, Y>, rhs: T) -> Matrix<X, Y> {
        var new_matrix: [X of [Y of Double]] = .init(repeating: .init(repeating: 0))
        
        for x in 0..<X {
        for y in 0..<Y {
            new_matrix[x][y] = lhs[x][y] * Double(rhs)
        }}
        
        return Matrix(new_matrix)
    }
    
    public static func *=<T: BinaryFloatingPoint> (lhs: inout Matrix<X, Y>, rhs: T) {
        lhs = lhs * rhs
    }
    
    public static func *<T: BinaryInteger> (lhs: T, rhs: Matrix<X, Y>) -> Matrix<X, Y> {
        var new_matrix: [X of [Y of Double]] = .init(repeating: .init(repeating: 0))
        
        for x in 0..<X {
        for y in 0..<Y {
            new_matrix[x][y] = rhs[x][y] * Double(lhs)
        }}
        
        return Matrix(new_matrix)
    }
    
    public static func *<T: BinaryFloatingPoint> (lhs: T, rhs: Matrix<X, Y>) -> Matrix<X, Y> {
        var new_matrix: [X of [Y of Double]] = .init(repeating: .init(repeating: 0))
        
        for x in 0..<X {
        for y in 0..<Y {
            new_matrix[x][y] = rhs[x][y] * Double(lhs)
        }}
        
        return Matrix(new_matrix)
    }
    
    /// Returns this [Matrix]'s transpose, which is the matrix flipped along it's diagonal
    public var transpose: Matrix<Y, X> {
        var new_matrix: [Y of [X of Double]] = .init(repeating: .init(repeating: 0))
        
        for x in 0..<X {
        for y in 0..<Y {
            new_matrix[y][x] = self[x][y]
        }}
        
        return Matrix<Y, X>(new_matrix)
    }
    
}

@available(macOS 26.0, iOS 26.0, *)
extension Matrix where X == Y {
    /// Creates a scalar [Matrix] where all of the diagonal values have the same value given to the method
    public static func scalar<T: BinaryInteger>(_ val: T) -> Matrix<X, Y> {
        var new_matrix: [X of [Y of Double]] = .init(repeating: .init(repeating: 0))
        
        for i in 0..<X {
            new_matrix[i][i] = Double(val)
        }
        
        return Matrix(new_matrix)
    }
    
    /// Creates a scalar [Matrix] where all of the diagonal values have the same value given to the method
    public static func scalar<T: BinaryFloatingPoint>(_ val: T) -> Matrix<X, Y> {
        var new_matrix: [X of [Y of Double]] = .init(repeating: .init(repeating: 0))
        
        for i in 0..<X {
            new_matrix[i][i] = Double(val)
        }
        
        return Matrix(new_matrix)
    }
    
    /// This property simply returns an identity [Matrix]
    public static var identity: Matrix<X, Y> {
        get {
            Matrix.scalar(1)
        }
    }
    
    public static func rotation (coord1: Int, coord2: Int, degrees: Double) -> Matrix<X, Y> {
        var new_matrix: Matrix<X, Y> = identity
        new_matrix[coord1][coord1] = cos(degrees*Pi/180)
        new_matrix[coord2][coord1] = -sin(degrees*Pi/180)
        new_matrix[coord1][coord2] = sin(degrees*Pi/180)
        new_matrix[coord2][coord2] = cos(degrees*Pi/180)
        return new_matrix
    }
}

/// [Vec] is a struct used to represent a vector with as many dimensions as you want. \
/// [Vec2d] is most often faster and easier to use than [Vec], but they both accomplish the same thing
/// You can do all normal arithmetic operations on the struct such as [+], [-], [*], [/]

@available(macOS 26.0, iOS 26.0, *)
public struct Vec<let D: Int> {
    /// The various components of the [Vec] such as [x], [y], [z], [w] and \[0..<D\]
    public var components: [D of Double]
    /// The [x] component of the [Vec]
    public var x: Double {
        get {
            self[0]
        }
        set(new_val) {
            self[0] = new_val
        }
    }
    /// The [y] component of the [Vec]
    public var y: Double {
        get {
            self[1]
        }
        set(new_val) {
            self[1] = new_val
        }
    }
    /// The [z] component of the [Vec]
    public var z: Double {
        get {
            self[2]
        }
        set(new_val) {
            self[2] = new_val
        }
    }
    /// The [w] component of the [Vec]
    public var w: Double {
        get {
            self[3]
        }
        set(new_val) {
            self[3] = new_val
        }
    }
    /// The length component of the of the [Vec]
    public var length: Double {
        get {
            var sum: Double = 0
            for i in 0..<D {
                sum += self[i] * self[i]
            }
            return sqrt(sum)
        }
        set(new_len) {
            self = unit * new_len
        }
    }
    
    /// Normalises the [Vec] and returns the resulting [Vec]
    public var unit: Vec<D> {
        self / length
    }
    
    public init(comps: [D of Double]) {
        self.components = comps
    }
    
    public init(_ comps: [D of Double]) {
        self.components = comps
    }
    
    public init(x: Double, y: Double) where D == 2 {
        self.components = [x, y]
    }
    
    public init(_ x: Double, _ y: Double) where D == 2 {
        self.components = [x, y]
    }
    
    public init(x: Double, y: Double, z: Double) where D == 3 {
        self.components = [x, y, z]
    }
    
    public init(_ x: Double, _ y: Double, _ z: Double) where D == 3 {
        self.components = [x, y, z]
    }
    
    public init(x: Double, y: Double, z: Double, w: Double) where D == 4 {
        self.components = [x, y, z, w]
    }
    
    public init(_ x: Double, _ y: Double, _ z: Double, _ w: Double) where D == 4 {
        self.components = [x, y, z, w]
    }
    
    public init(from_v: Matrix<1, D>) {
        self.components = from_v[0]
    }
    
    public init(from_h: Matrix<D, 1>) {
        self.components = .init { index in from_h[index][0] }
    }
    
    public init(v2d: Vec2d) where D == 2 {
        self.components = [v2d.x, v2d.y]
    }
    
    public subscript(index: Int) -> Double {
        get {
            index < D ? components[index] : .zero
        }
        set(new_val) {
            guard index < D else {
                return
            }
            components[index] = new_val
        }
    }
    
    public static func + (lhs: Vec<D>, rhs: Vec<D>) -> Vec<D> {
        var new_vec: Vec<D> = lhs
        for i in 0..<D {
            new_vec[i] += rhs[i]
        }
        return new_vec
    }
    
    public static func += (lhs: inout Vec<D>, rhs: Vec<D>) {
        lhs = lhs + rhs
    }
    
    public static func - (lhs: Vec<D>, rhs: Vec<D>) -> Vec<D> {
        var new_vec: Vec<D> = lhs
        for i in 0..<D {
            new_vec[i] -= rhs[i]
        }
        return new_vec
    }
    
    public static func -= (lhs: inout Vec<D>, rhs: Vec<D>) {
        lhs = lhs - rhs
    }
    
    public static func * (lhs: Vec<D>, rhs: Vec<D>) -> Double {
        var sum: Double = 0
        for i in 0..<D {
            sum += lhs[i] * rhs[i]
        }
        return sum
    }
    
    public static func *<T: BinaryInteger> (lhs: Vec<D>, rhs: T) -> Vec<D> {
        var new_vec: Vec<D> = lhs
        for i in 0..<D {
            new_vec[i] *= Double(rhs)
        }
        return new_vec
    }
    
    public static func *=<T: BinaryInteger> (lhs: inout Vec<D>, rhs: T) {
        lhs = lhs * rhs
    }
    
    public static func *<T: BinaryFloatingPoint> (lhs: Vec<D>, rhs: T) -> Vec<D> {
        var new_vec: Vec<D> = lhs
        for i in 0..<D {
            new_vec[i] *= Double(rhs)
        }
        return new_vec
    }
    
    public static func *=<T: BinaryFloatingPoint> (lhs: inout Vec<D>, rhs: T) {
        lhs = lhs * rhs
    }
    
    public static func *<T: BinaryInteger> (lhs: T, rhs: Vec<D>) -> Vec<D> {
        var new_vec: Vec<D> = rhs
        for i in 0..<D {
            new_vec[i] *= Double(lhs)
        }
        return new_vec
    }
    
    public static func *<T: BinaryFloatingPoint> (lhs: T, rhs: Vec<D>) -> Vec<D> {
        var new_vec: Vec<D> = rhs
        for i in 0..<D {
            new_vec[i] *= Double(lhs)
        }
        return new_vec
    }
    
    public static func /<T: BinaryInteger> (lhs: Vec<D>, rhs: T) -> Vec<D> {
        var new_vec: Vec<D> = lhs
        for i in 0..<D {
            new_vec[i] /= Double(rhs)
        }
        return new_vec
    }
    
    public static func /=<T: BinaryInteger> (lhs: inout Vec<D>, rhs: T) {
        lhs = lhs / rhs
    }
    
    public static func /<T: BinaryFloatingPoint> (lhs: Vec<D>, rhs: T) -> Vec<D> {
        var new_vec: Vec<D> = lhs
        for i in 0..<D {
            new_vec[i] /= Double(rhs)
        }
        return new_vec
    }
    
    public static func /=<T: BinaryFloatingPoint> (lhs: inout Vec<D>, rhs: T) {
        lhs = lhs / rhs
    }
    
    public static func /<T: BinaryInteger> (lhs: T, rhs: Vec<D>) -> Vec<D> {
        var new_vec: Vec<D> = rhs
        for i in 0..<D {
            new_vec[i] = Double(lhs) / new_vec[i]
        }
        return new_vec
    }
    
    public static func /<T: BinaryFloatingPoint> (lhs: T, rhs: Vec<D>) -> Vec<D> {
        var new_vec: Vec<D> = rhs
        for i in 0..<D {
            new_vec[i] = Double(lhs) / new_vec[i]
        }
        return new_vec
    }
    
    public static func == (lhs: Vec<D>, rhs: Vec<D>) -> Bool {
        for i in 0..<D {
            if lhs[i] != rhs[i] {
                return false
            }
        }
        return true
    }
    
    public static func != (lhs: Vec<D>, rhs: Vec<D>) -> Bool {
        for i in 0..<D {
            if lhs[i] == rhs[i] {
                return false
            }
        }
        return true
    }
    
    /// Calculates the distance between two [Vec]s
    public static func distance (_ lhs: Vec<D>, _ rhs: Vec<D>) -> Double {
        (lhs - rhs).length
    }
    
    /// Calculates the distance between two [Vec]s
    public static func distance<T: BinaryInteger> (_ lhs: Vec<D>, _ rhs: Vec<D>) -> T {
        T((lhs - rhs).length)
    }
    
    /// Calculates the distance between two [Vec]s
    public static func distance<T: BinaryFloatingPoint> (_ lhs: Vec<D>, _ rhs: Vec<D>) -> T {
        T((lhs - rhs).length)
    }
    
    /// Calculates the distance between two [Vec]s
    public func distance (_ rhs: Vec<D>) -> Double {
        (self - rhs).length
    }
    
    /// Calculates the distance between two [Vec]s
    public func distance<T: BinaryInteger> (_ rhs: Vec<D>) -> T {
        T((self - rhs).length)
    }
    
    /// Calculates the distance between two [Vec]s
    public func distance<T: BinaryFloatingPoint> (_ rhs: Vec<D>) -> T {
        T((self - rhs).length)
    }
}

