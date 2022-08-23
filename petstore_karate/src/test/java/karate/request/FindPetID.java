package karate.request;

import com.intuit.karate.junit5.Karate;

public class FindPetID {
    @Karate.Test
    Karate testSample() {
        return Karate.run("classpath:karate/request/get.feature").relativeTo(getClass());
    }
}
