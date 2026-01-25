---
title: SpringBoot常用注解
date: 2024-05-11
sidebar: auto
tags: 
 - Java
categories:
 - Java
---

1. 启动注解：@SpringBootApplication 是核心，用于启动类，整合了配置、自动装配和组件扫描。
2. 组件注册：用 @Controller、@Service、@Repository、@Component 将类交给Spring管理，分层清晰。
3. 依赖注入：用 @Autowired 自动注入Bean，配合 @Qualifier 按名称指定；@Value 注入配置值。
4. Web接口：@RestController 定义控制器，@GetMapping、@PostMapping 等映射请求，@RequestBody 接收JSON数据。
5. 配置绑定：@ConfigurationProperties 把配置文件中的属性自动绑定到Java对象，类型安全又简洁。
