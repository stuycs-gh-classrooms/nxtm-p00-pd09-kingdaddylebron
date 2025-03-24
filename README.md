[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/rXX1_Uiw)
## Project 00
### NeXTCS
### Period: 9
## Name0: Matthew Ciu
## Name1: Rafsan Ahmed 
## Name2: Timothy Louie 
---

This project will be completed in phases. The first phase will be to work on this document. Use github-flavoured markdown. (For more markdown help [click here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) or [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) )

All projects will require the following:
- Researching new forces to implement.
- Method for each new force, returning a `PVector`  -- similar to `getGravity` and `getSpring` (using whatever parameters are necessary).
- A distinct demonstration for each individual force (including gravity and the spring force).
- A visual menu at the top providing information about which simulation is currently active and indicating whether movement is on or off.
- The ability to toggle movement on/off
- The ability to toggle bouncing on/off
- The user should be able to switch _between_ simluations using the number keys as follows:
  - `1`: Gravity
  - `2`: Spring Force
  - `3`: Drag
  - `4`: Custom Force
  - `5`: Combination


## Phase 0: Force Selection, Analysis & Plan
---------- 

#### Custom Force: Wind Force

### Forumla
What is the formula for your force? Including descriptions/definitions for the symbols. (You may include a picture of the formula if it is not easily typed.)

F = A * P * Cd
A = Projected area of obj being collided with
P = Wind pressure 
Cd = Drag Coefficient 

### Custom Force
- What information that is already present in the `Orb` or `OrbNode` classes does this force use?
  - All of that

- Does this force require any new constants, if so what are they and what values will you try initially?
  - Yes, P

- Does this force require any new information to be added to the `Orb` class? If so, what is it and what data type will you use?
  - No

- Does this force interact with other `Orbs`, or is it applied based on the environment?
  - Applied based on the Environment

- In order to calculate this force, do you need to perform extra intermediary calculations? If so, what?
  - Yes, it would have to do extra intermediary calculations. It would have to calculate the wind pressure and the area of the orb, affecting the wind force. 

--- 

### Simulation 1: Gravity
Describe how you will attempt to simulate orbital motion.

The largest object will act as the center of gravity. Other objects will revolve around it. 
--- 

### Simulation 2: Spring
Describe what your spring simulation will look like. Explain how it will be setup, and how it should behave while running.

Like Super Mario Galaxy with Orbs 
![image](https://github.com/user-attachments/assets/7eab4738-80c9-4a6f-a085-073444d1cf71)


--- 

### Simulation 3: Drag
Describe what your drag simulation will look like. Explain how it will be setup, and how it should behave while running.

Speed of orb decrease as drag increase 😊

--- 

### Simulation 4: Custom force
Describe what your Custom force simulation will look like. Explain how it will be setup, and how it should behave while running.

A gust of wind comes in from a specific border, and all orbs are influenced by the wind. If the orb is a paperweight, it could go all the way to the opposing side while a heavier weight might only be pushed slightly out of its existing path. 

--- 

### Simulation 5: Combination
Describe what your combination simulation will look like. Explain how it will be setup, and how it should behave while running.

Everything, Everywhere All At Once

