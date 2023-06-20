<p align="center">
<img src="Modules/frontend/static/icons/Hipster_HeroLogoCyan.svg" width="300" alt="Online Boutique" />
</p>

# Online Boutique

**Online Boutique** es una aplicación de demostración de microservicios nativa de la nube. Online Boutique consta de una aplicación de microservicios de 10 niveles. La aplicación es una aplicación de comercio electrónico basada en la web donde los usuarios pueden buscar artículos, agregarlos al carrito y comprarlos.

## Screenshots

| Home Page                                                                                                         | Checkout Screen                                                                                                    |
| ----------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| [![Screenshot of store homepage](./docs/img/online-boutique-frontend-1.png)](./docs/img/online-boutique-frontend-1.png) | [![Screenshot of checkout screen](./docs/img/online-boutique-frontend-2.png)](./docs/img/online-boutique-frontend-2.png) |

## Detalles de la implementación
### Arquitectura a desplegar en Cloud (Micro-servicios)

**Online Boutique** está compuesto por 11 microservicios escritos en diferentes idiomas que se comunican entre sí a través de gRPC. 

[![Architecture of
microservices](./docs/img/architecture-diagram.png)](./docs/img/architecture-diagram.png)

### Diagrama de arquitectura completo
Poner imagen del diagrama de arquitectura con las fuentes e iconografía típicos de un
diagrama de AWS. El mismo deberá incluir el networking a implementar.

### Descripción de los servicios

| Servicio                                              | Lenguaje      | Descripción                                                                                                                       |
| ---------------------------------------------------- | ------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| [frontend](./Modules/frontend)                           | Go            | Expone un servidor HTTP para servir el sitio web. No requiere registro/inicio de sesión y genera ID de sesión para todos los usuarios automáticamente. |
| [cartservice](./Modules/cartservice)                     | C#            | Almacena los artículos en el carrito de compras del usuario en Redis y los recupera.                                                           |
| [productcatalogservice](./Modules/productcatalogservice) | Go            | Proporcione la lista de productos de un archivo JSON y la capacidad de buscar productos y obtener productos individuales.                        |
| [currencyservice](./Modules/currencyservice)             | Node.js       | Convierte una cantidad de dinero a otra moneda. Utiliza valores reales obtenidos del Banco Central Europeo. Es el servicio QPS más alto. |
| [paymentservice](./Modules/paymentservice)               | Node.js       | Carga la información de la tarjeta de crédito dada (simulacro) con el monto dado y devuelve una identificación de transacciones.                                     |
| [shippingservice](./Modules/shippingservice)             | Go            | Brinda estimaciones de costos de envío basados ​​en el carrito de compras. Envía artículos a la dirección dada (simulacro)                                 |
| [emailservice](./Modules/emailservice)                   | Python        | Envía a los usuarios un correo electrónico de confirmación del pedido (simulacro).                                                                                   |
| [checkoutservice](./Modules/checkoutservice)             | Go            | Recupera el carrito del usuario, prepara el pedido y organiza el pago, el envío y la notificación por correo electrónico.                            |
| [recommendationservice](./Modules/recommendationservice) | Python        | Recomienda otros productos según lo que se proporcione en el carrito.                                                                      |
| [adservice](./Modules/adservice)                         | Java          | Proporciones de anuncios de texto basados ​​en palabras de contexto dadas.                                                                                   |
| [loadgenerator](./Modules/loadgenerator)                 | Python/Locust | Envía solicitudes continuamente que imitan flujos de compras de usuarios realistas a la interfaz.                                              |

### Datos de la infraestructura 
(tipo de instancia, bloques CIDRs, Firewalling, etc)

### Servicios de AWS usados
1. Amazon Elastic Compute Cloud (AWS EC2)
1. Amazon Virtual Private Cloud (AWS VPC)
1. Amazon Elastic Container Registry (AWS ECR)
1. Amazon Elastic Kubernetes Service (AWS EKS)
## Referencias
- Material de Aulas - Implementación de soluciones cloud
- [Info AWS](https://aws.amazon.com/es/)
- [Doc AWS](https://docs.aws.amazon.com/)
- [Doc Amazon Elastic Compute Cloud](https://docs.aws.amazon.com/ec2/?icmpid=docs_homepage_featuredsvcs)
- [Doc Amazon Virtual Private Cloud](https://docs.aws.amazon.com/vpc/?icmpid=docs_homepage_featuredsvcs)
- [Doc Amazon Elastic Container Registry](https://docs.aws.amazon.com/ecr/?icmpid=docs_homepage_containers)
- [Doc Amazon Elastic Kubernetes Service](https://docs.aws.amazon.com/eks/?icmpid=docs_homepage_containers)
- [Info Terraform](https://registry.terraform.io/)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform AWS](https://developer.hashicorp.com/terraform/tutorials/aws-get-started)
- [Terraform Docker](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs)
- [Terraform Null](https://registry.terraform.io/providers/hashicorp/null/latest/docs)
- [Terraform Local Module](https://developer.hashicorp.com/terraform/tutorials/modules/module-create)


##Otros estilos a usar

    enter code here

> Blockquote

 - List item

1. Lista

 - [ ] List item check