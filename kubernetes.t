---
apiVersion: v1
kind: Service
metadata:
 name: ##artifactId-svc
spec:
 selector:
  app: ##artifactId
 ports:
  - protocol: "TCP"
    port: 8080
    targetPort: 8080
 type: LoadBalancer

---
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
 name: ##artifactId-ingress
 annotations:
  nginx.ingress.kubernetes.io/rewrite-target: /
spec:
 rules:
  - http:
     paths:
      - path: /##baseModel
        backend:
         serviceName: ##artifactId-svc
         servicePort: 8080

---
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
 name: ##artifactId
spec:
 replicas: 2
 template:
  metadata:
   labels:
    app: ##artifactId
    version: v0.1.0
  spec:
   containers:
    - name: ##artifactId
      image: 10.0.0.14:443/com.techadit/##artifactId:latest
      imagePullPolicy: Always
      ports:
       - containerPort: 8080