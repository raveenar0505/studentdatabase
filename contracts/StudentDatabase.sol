// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentContract {
    
    struct Student {
        uint256 id;
        string name;
        uint256 age;
        string major;
    }
    
    mapping(uint256 => Student) public students;
    uint256 public studentsCount;
    
    event StudentAdded(uint256 id, string name, uint256 age, string major);
    event StudentUpdated(uint256 id, string name, uint256 age, string major);
    
    function addStudent(string memory _name, uint256 _age, string memory _major) public {
        studentsCount++;
        students[studentsCount] = Student(studentsCount, _name, _age, _major);
        emit StudentAdded(studentsCount, _name, _age, _major);
    }
    
    function updateStudent(uint256 _id, string memory _name, uint256 _age, string memory _major) public {
        require(_id > 0 && _id <= studentsCount, "Invalid student ID");
        students[_id] = Student(_id, _name, _age, _major);
        emit StudentUpdated(_id, _name, _age, _major);
    }
    
    function getStudent(uint256 _id) public view returns (uint256, string memory, uint256, string memory) {
        require(_id > 0 && _id <= studentsCount, "Invalid student ID");
        Student memory student = students[_id];
        return (student.id, student.name, student.age, student.major);
    }
}
//0x5FbDB2315678afecb367f032d93F642f64180aa3