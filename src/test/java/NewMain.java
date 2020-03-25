//
//import com.healthcare.healthcarebooking.entities.Client;
//import javax.persistence.EntityManager;
//import javax.persistence.EntityManagerFactory;
//import org.springframework.context.annotation.AnnotationConfigApplicationContext;
//
//public class NewMain {
//
//    public static void main(String[] args) {
//        AnnotationConfigApplicationContext context
//                = new AnnotationConfigApplicationContext(Configurer.class);
//        EntityManagerFactory entityManagerFactory
//                = context.getBean(EntityManagerFactory.class);
//        EntityManager entityManager
//                = entityManagerFactory.createEntityManager();
//        entityManager.persist(
//                new Client("vvxxc@xczxc", "fullName", "25 - 10 - 2020", "message")
//        );
//    }
//}
