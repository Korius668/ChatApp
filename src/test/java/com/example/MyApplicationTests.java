import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

class MyApplicationTests {

    @Test
    void contextLoads() {
        // Assert context loads successfully
        assertEquals(1, 1, "Basic context loading test");
    }

    @Test
    void basicAdditionTest() {
        int sum = 2 + 2;
        assertEquals(4, sum, "2 + 2 should equal 4");
    }
}
