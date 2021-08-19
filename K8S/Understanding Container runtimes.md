# Worker node detailed view

![image](https://user-images.githubusercontent.com/13942355/129881885-eb488ef3-c909-40a5-89cf-375500d80e49.png)

- Kubelet processes pod specs from the API server 
- Scheduler is responsible to indicate which worker node’s kubelet the API server must talk to when sending over the pod specs
- Kubelet interfaces with the configured container runtime to run the pods and contained containers 
- It is the container runtime which is responsible for pulling the images from the registry , creating the writable layer on top spinning up the containers and ultimately executing them 
- Kubelet is nothing more than an orchestrator triggered by the control plane 
- The image of the left is the earliest iteration of K8s where docker was used as the container runtime 

# Not necessarily a K8s construct

![image](https://user-images.githubusercontent.com/13942355/129881965-4bd96030-187e-4266-99b7-0f30429fa8ba.png)

- Container runtimes are relatable from a pure docker construct 
- What we know as docker is a monolith that is docker CLI + docker dameon + Higher level container runtime + lower-level container runtime 
- The ‘brain’ in this monolithic app is the higher-level container runtime ( which is containerd) 
- Execution though is done by the lower-level container runtime which is runc by default 
- Lower-level container runtime can run any OCI compliant image – build image using podman or rkt and run it with docker CLI 
- This monolithic docker app must have never been used as-is in K8S  to start with 

# Container runtime interface

![image](https://user-images.githubusercontent.com/13942355/129882136-e886c9f7-43c2-4904-9fda-51417a73e05e.png)

- Abstracts out the higher-level container runtime from orchestrator
- Implemented over gRPC.
- If higher-level container runtimes respect gRPC , they can be seamlessly added/switched  from any orchestrator 

# View after CRI was enforced

![image](https://user-images.githubusercontent.com/13942355/129882262-e0ef6f80-262c-4d1d-9c3b-54338c6b78cb.png)

# Evolution from K8s perspective

![image](https://user-images.githubusercontent.com/13942355/129882325-bd3e3c72-479b-42e9-9f34-8348972f525c.png)


 
