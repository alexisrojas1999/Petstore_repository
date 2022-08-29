package karate.pet;

import com.intuit.karate.junit5.Karate;

public class FindPetID {
    @Karate.Test
    Karate testSample() {
        return Karate.run("classpath:Karate/pet/2.FindPet/get.feature").relativeTo(getClass());
    }
}
