# Run searchit in backgroud
`nohup searchit aloha  > /dev/null 2>&1 &`

--- 
## Approce #1
 - Create another shell script as a wrapper
 - it will execude additional commands 
   - `nohup`
   - `main searchit command`
   - `> /dev/null 2>&1 &`
  
- Final command would be like this ` nohup ` `$(main command)` `> /dev/null 2>&1 &`
- Main command example `seachit -ggl guitar`

### Steps:
- [ ] Create a searchit-wrapper
    - [ ] get user input
    - [ ] Segmentation of the input
    - [ ] Parse main command
    - [ ] Execude main Searchit program with wrapper commands
- [ ] Rename `Searchit` file to `Searchit-Core` or something else
- [ ] Rename `Searchit` to `Searchit-Core` in codebase
- [ ] Find a way to that updating does not breaks the software 😆

### Probable Bugs:
 - [ ] Functionality that needs to display something like about or version check
   - [ ]  Need to check main command parameters to determine to execute with wrapper or not. 