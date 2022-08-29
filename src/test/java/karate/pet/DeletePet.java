package karate.pet;

import com.intuit.karate.junit5.Karate;

public class DeletePet {
    @Karate.Test
    Karate testSample() {
        return Karate.run("classpath:Karate/pet/4.DeletePet/delete.feature").relativeTo(getClass());
    }
}
