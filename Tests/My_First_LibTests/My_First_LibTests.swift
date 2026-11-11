import Testing
@testable import VESVecs

@Test func example() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    // Swift Testing Documentation
    // https://developer.apple.com/documentation/testing
    let a = Vec2d(3, 4)
    print(a.x, a.y, a.length)
    let b = Vec2d(4, 3)
    print(b.x, b.y, b.length)
    let c = a + b
    print(c.length)
    let d = a*c
    print(d)
}
