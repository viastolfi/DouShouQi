# DuoShouQi_VincentAstolfi

Poject made during the Swift module during my 3rd year at the IUT informatique d'Aubière.

**The subject of this project and the rules of the DouShouQi games can be find here**

https://codefirst.iut.uca.fr/git/mchSamples_Apple/DouShouQi

## Using Xcode

### Running Application 

- Clone the repository using : 
```shell
git clone https://codefirst.iut.uca.fr/git/vincent.astolfi/DuoShouQi_VincentAstolfi.git
```

- Open Xcode then select open an existing project

<img src="images/select_open_project_screen.png" alt="select open an existing project" width="auto" height="auto">

- Click on the workspace folder in Sources

<img src="images/select_workspace_screen.png" alt="Select workspace screen" width="auto" height="auto">

- In Xcode, you can now choose the project you want to start

<img src="images/select_package_screen.png" alt="Select strating package" width="auto" height="auto">

If you choose `Application` and then run it you will see the Board that is create as it is in the example. 

<img src="images/output_screen.png" alt="Application output" width="auto" height="auto">

You can also choose the Tests package to run them. I've create some test that don't cover all the code but a part of them.

### Running Test

If you select `Model` as your starting project and then run it you will run all the UnitTest of the Model package

You could also run them by going to the special Xcode section for the test on the top left corner of your screen

<img src="images/run_test_section.png" alt="Run test section" width="200" height="auto">

Then you can see the code coverage of the project in the Xcode section

<img src="images/code_coverage_section.png" alt="Code coverage section" widht="200" height="400">

You can also get more detail on the code coverage by clicking on the `Coverage`

<img src="images/code_coverage_detail.png" alt="Code coverage detail" height="auto" width="auto">

## Using the terminal

### Running Test

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