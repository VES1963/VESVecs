import Testing
@testable import VESVecs

@available(macOS 26.0, iOS 26.0, *)
@Test func example() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    // Swift Testing Documentation
    // https://developer.apple.com/documentation/testing
    let R: Matrix<2, 2> = Matrix.rotation(coord1: 0, coord2: 1, degrees: 90)
    print("""
\(R[0][0]), \(R[1][0])
\(R[0][1]), \(R[1][1])
""")
    let a: Vec<2> = Vec(3, 4)
    print(a.x, a.y, a.length)
    let b: Vec<2> = Vec<2>(from_h: Matrix<2,1>(from_h: a) * R)
    print(b.x, b.y)
    let c = a + b
    print(c.length)
    let d = a * c
    print(d)
}
