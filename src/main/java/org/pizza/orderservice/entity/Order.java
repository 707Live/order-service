package org.pizza.orderservice.entity;


import lombok.*;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;


@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Document(collection = "orders")
public class Order {

    @Id
    private String id;

    private String product;
    private Integer quantity;
    private Double price;
    private String status;

}
