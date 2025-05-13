using Xunit;
using FluentAssertions;

namespace HelloDevOps.Tests;

public class MathTests
{
    [Fact]
    public void Add_TwoPlusTwo_ReturnsFour()
    {
        int result = 2 + 2;
        result.Should().Be(4);
    }
}
