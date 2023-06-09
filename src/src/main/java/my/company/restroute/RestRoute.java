package my.company.restroute;

// camel-k: language=java

import org.apache.camel.builder.RouteBuilder;

import org.springframework.stereotype.Component;

@Component
public class RestRoute extends RouteBuilder {

    @Override
    public void configure() throws Exception {

        
        from("rest://{{restroute.method}}:/{{restroute.path}}")
            .routeId("restroute")
            .to("{{restroute.url}}?httpMethod={{restroute.method}}&bridgeEndpoint=true&throwExceptionOnFailure=false")
            .log("${body}");

            
    }
}
