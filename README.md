# DuoShouQi_VincentAstolfi

Poject made during the Swift module during my 3rd year at the IUT informatique d'Aubière.

**The subject of this project and the rules of the DouShouQi games can be find here**

https://codefirst.iut.uca.fr/git/mchSamples_Apple/DouShouQi

## Run the project

### Using Xcode 

- Clone the repository using : 
```shell
git clone https://codefirst.iut.uca.fr/git/vincent.astolfi/DuoShouQi_VincentAstolfi.git
```

- Open Xcode then select open an existing project

![select open an existing project](images/select_open_project_screen.png)

- Click on the workspace folder in Sources

![Select workspace screen](images/select_workspace_screen.png)

- In Xcode, you can now choose the project you want to start

![Select strating package](images/select_package_screen.png)

If you choose `Application` and then run it you will see the Board that is create as it is in the example. 

You can also choose the Tests package to run them. I've create some test that don't cover all the code but a part of them.

### Run test using terminal

- Clone the repository using : 
```shell
git clone https://codefirst.iut.uca.fr/git/vincent.astolfi/DuoShouQi_VincentAstolfi.git
```

- Go in the sources folder :

```shell
cd Sources
```

- To get all the runnable project type :

```shell
xcodebuild -list
```

- To run test type :

```shell
xcodebuild test -scheme *TestPackage*
```

The actual possible test package are :

    ModelExtensionsTests,
    ModelTests