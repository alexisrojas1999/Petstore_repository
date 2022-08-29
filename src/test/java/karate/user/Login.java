package karate.user;
import com.intuit.karate.junit5.Karate;

public class Login {
    @Karate.Test
    Karate testSample(){
        return Karate.run("classpath:Karate/user/login/login.feature").relativeTo(getClass());
    }
}


