spring:
  profiles:
    active: dev
  datasource:
    url: jdbc:h2:mem:testdb
    username: sa
    password: dbpass
    hikari:
      connection-timeout: 600
      maximum-pool-size: 5
    driverClassName: org.h2.Driver
  jpa:
    show-sql: false
    hibernate:
      ddl-auto: create-drop
      naming:
        physical-strategy: org.hibernate.boot.model.naming.PhysicalNamingStrategyStandardImpl
    properties:
      hibernate:
        dialect: org.hibernate.dialect.H2Dialect
        enable_lazy_load_no_trans: true
    database-platform: org.hibernate.dialect.H2Dialect
logging:
  level:
    root: info
    org:
      hibernate:
        SQL: off
        type:
          descriptor:
            sql: off    
server:
  port: 8080

##baseModel-uri