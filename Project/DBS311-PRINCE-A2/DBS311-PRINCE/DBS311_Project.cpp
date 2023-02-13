///*
//	College registration system – Group 5
//-------------------- Done By ---------------------
//Name: Prince Jodhani		Student ID : 149455206
//Name: Juvairiya Shaikh	 Studen ID : 145185203
//Name : Juan Castel	 	Student ID : 147891204
//-------------------------------------------------
//*/
//
//
//#include <iostream>
//#include <occi.h>
//
//using oracle::occi::Environment;
//using oracle::occi::Connection;
//using namespace oracle::occi;
//using namespace std;
//
//int main(void)
//{
//	Environment* env = nullptr;
//	Connection* conn = nullptr;
//
//	string str;
//	string usr = "dbs311_221f19";
//	string pass = "14094372";
//	string srv = "myoracle12c.senecacollege.ca:1521/oracle12c";
//
//	try
//	{
//		env = Environment::createEnvironment(Environment::DEFAULT);
//		conn = env->createConnection(usr, pass, srv);
//		Statement* stmt = conn->createStatement();
//
//		ResultSet* rs = stmt->executeQuery("SELECT * FROM students");
//		cout << "-----------------" << endl;
//		cout << "  Student Table  " << endl;
//		cout << "-----------------" << endl;
//		cout << "Stud ID |  Student Name  | Contact Number | 	  Address	  | Parent Mobile | Academic Standing | CourseID |   Degree   | Overall GPA |" << endl;
//		cout << "---------------------------------------------------------------------------------------------------------------------------------------------" << endl;
//		while (rs->next())
//		{
//
//
//			cout.width(10);
//			cout.setf(ios::left);
//			cout << rs->getInt(1);
//			cout.unsetf(ios::left);
//
//			cout.width(17);
//			cout.setf(ios::left);
//			cout << rs->getString(2);
//			cout.unsetf(ios::left);
//
//			cout.width(17);
//			cout.setf(ios::left);
//			cout << rs->getString(3);
//			cout.unsetf(ios::left);
//
//			cout.width(24);
//			cout.setf(ios::left);
//			cout << rs->getString(4);
//			cout.unsetf(ios::left);
//
//			cout.width(16);
//			cout.setf(ios::left);
//			cout << rs->getString(5);
//			cout.unsetf(ios::left);
//			
//
//			cout.width(20);
//			cout.setf(ios::left);
//			cout << rs->getString(6);
//			cout.unsetf(ios::left);
//
//			cout.width(13);
//			cout.setf(ios::left);
//			cout << rs->getInt(7);
//			cout.unsetf(ios::left);
//
//			cout.width(11);
//			cout.setf(ios::left);
//			cout << rs->getString(8);
//			cout.unsetf(ios::left);
//
//			cout.width(5);
//			cout.setf(ios::left);
//			cout << rs->getDouble(9);
//			cout.unsetf(ios::left);
//			cout << endl;
//		}
//
//
//		conn->terminateStatement(stmt);
//		env->terminateConnection(conn);
//		Environment::terminateEnvironment(env);
//	}
//	catch (SQLException& sqlExcp)
//	{
//		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
//	}
//	cout << endl << endl;
//
//	try
//	{
//		env = Environment::createEnvironment(Environment::DEFAULT);
//		conn = env->createConnection(usr, pass, srv);
//	
//
//		Statement* stmt = conn->createStatement();
//
//		ResultSet* rs = stmt->executeQuery("SELECT * FROM stud_fees");
//		cout << "-------------------" << endl;
//		cout << "  stud_fees Table  " << endl;
//		cout << "-------------------" << endl;
//		cout << "Stud ID | Current Sem | Paid Fees | Payment Method | Payment Status |" << endl;
//		cout << "---------------------------------------------------------------------" << endl;
//
//		while (rs->next())
//		{
//		
//
//			cout.width(10);
//			cout.setf(ios::left);
//			cout << rs->getInt(1);
//			cout.unsetf(ios::left);
//
//			cout.width(14);
//			cout.setf(ios::left);
//			cout << rs->getString(2);
//			cout.unsetf(ios::left);
//
//			cout.width(12);
//			cout.setf(ios::left);
//			cout << rs->getString(3);
//			cout.unsetf(ios::left);
//
//			cout.width(17);
//			cout.setf(ios::left);
//			cout << rs->getString(4);
//			cout.unsetf(ios::left);
//			
//			cout.width(19);
//			cout.setf(ios::left);
//			cout << rs->getString(5);
//			cout.unsetf(ios::left);
//			cout << endl;	
//		}
//
//
//		conn->terminateStatement(stmt);
//		env->terminateConnection(conn);
//		Environment::terminateEnvironment(env);
//	}
//	catch (SQLException& sqlExcp)
//	{
//		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
//	}
//	
//	try
//	{
//		env = Environment::createEnvironment(Environment::DEFAULT);
//		conn = env->createConnection(usr, pass, srv);
//
//
//		Statement* stmt = conn->createStatement();
//
//		ResultSet* rs = stmt->executeQuery("SELECT * FROM registration");
//		cout << endl << endl;
//		cout << "----------------------" << endl;
//		cout << "  registration Table  " << endl;
//		cout << "----------------------" << endl;
//		cout << "Stud ID | Enrolled | noOfSubjects | Tot Credits | Passed Sub | Failed Sub | Fees Paid | Graduated | Current Sem | Start Date    |" << endl;
//		cout << "---------------------------------------------------------------------------------------------------------------------------------" << endl;
//		while (rs->next())
//		{
//
//
//			cout.width(10);
//			cout.setf(ios::left);
//			cout << rs->getInt(1);
//			cout.unsetf(ios::left);
//
//			cout.width(11);
//			cout.setf(ios::left);
//			cout << rs->getString(2);
//			cout.unsetf(ios::left);
//
//			cout.width(15);
//			cout.setf(ios::left);
//			cout << rs->getInt(3);
//			cout.unsetf(ios::left);
//
//			cout.width(14);
//			cout.setf(ios::left);
//			cout << rs->getInt(4);
//			cout.unsetf(ios::left);
//
//			cout.width(13);
//			cout.setf(ios::left);
//			cout << rs->getInt(5);
//			cout.unsetf(ios::left);
//			
//
//			cout.width(13);
//			cout.setf(ios::left);
//			cout << rs->getInt(6);
//			cout.unsetf(ios::left);
//			
//
//			cout.width(12);
//			cout.setf(ios::left);
//			cout << rs->getInt(7);
//			cout.unsetf(ios::left);
//			
//
//			cout.width(12);
//			cout.setf(ios::left);
//			cout << rs->getString(8);
//			cout.unsetf(ios::left);
//			
//
//			cout.width(14);
//			cout.setf(ios::left);
//			cout << rs->getInt(9);
//			cout.unsetf(ios::left);
//			
//
//			cout.width(15);
//			cout.setf(ios::left);
//			cout << rs->getString(10);
//			cout.unsetf(ios::left);
//			cout << endl;
//		}
//
//
//		conn->terminateStatement(stmt);
//		env->terminateConnection(conn);
//		Environment::terminateEnvironment(env);
//	}
//	catch (SQLException& sqlExcp)
//	{
//		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
//	}
//
//	try
//	{
//		env = Environment::createEnvironment(Environment::DEFAULT);
//		conn = env->createConnection(usr, pass, srv);
//
//
//		Statement* stmt = conn->createStatement();
//
//		ResultSet* rs = stmt->executeQuery("SELECT * FROM professors");
//		cout << endl << endl;
//		cout << "--------------------" << endl;
//		cout << "  professors Table  " << endl;
//		cout << "--------------------" << endl;
//		cout << "Prof ID | Professor Name | Course Id | Start Date |" << endl;
//		cout << "---------------------------------------------------" << endl;
//		while (rs->next())
//		{
//
//
//			cout.width(10);
//			cout.setf(ios::left);
//			cout << rs->getInt(1);
//			cout.unsetf(ios::left);
//
//			cout.width(17);
//			cout.setf(ios::left);
//			cout << rs->getString(2);
//			cout.unsetf(ios::left);
//
//			cout.width(12);
//			cout.setf(ios::left);
//			cout << rs->getInt(3);
//			cout.unsetf(ios::left);
//
//			cout.width(17);
//			cout.setf(ios::left);
//			cout << rs->getString(4);
//			cout.unsetf(ios::left);
//			cout << endl;
//		}
//
//
//		conn->terminateStatement(stmt);
//		env->terminateConnection(conn);
//		Environment::terminateEnvironment(env);
//	}
//	catch (SQLException& sqlExcp)
//	{
//		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
//	}
//
//	try
//	{
//		env = Environment::createEnvironment(Environment::DEFAULT);
//		conn = env->createConnection(usr, pass, srv);
//
//
//		Statement* stmt = conn->createStatement();
//
//		ResultSet* rs = stmt->executeQuery("SELECT * FROM courses");
//		cout << endl << endl;
//		cout << "-----------------" << endl;
//		cout << "  courses Table  " << endl;
//		cout << "-----------------" << endl;
//		cout << "Course ID | Course Name |" << endl;
//		cout << "-------------------------" << endl;
//		while (rs->next())
//		{
//
//
//			cout.width(12);
//			cout.setf(ios::left);
//			cout << rs->getInt(1);
//			cout.unsetf(ios::left);
//
//			cout.width(9);
//			cout.setf(ios::left);
//			cout << rs->getString(2);
//			cout.unsetf(ios::left);
//			cout << endl;
//		}
//
//
//		conn->terminateStatement(stmt);
//		env->terminateConnection(conn);
//		Environment::terminateEnvironment(env);
//	}
//	catch (SQLException& sqlExcp)
//	{
//		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
//	}
//
//
//	try
//	{
//		env = Environment::createEnvironment(Environment::DEFAULT);
//		conn = env->createConnection(usr, pass, srv);
//
//
//		Statement* stmt = conn->createStatement();
//
//		ResultSet* rs = stmt->executeQuery("SELECT * FROM advisors");
//		cout << endl << endl;
//		cout << "------------------" << endl;
//		cout << "  advisors Table  " << endl;
//		cout << "------------------" << endl;
//		cout << "Advisor ID | Advisor Name | Course ID |" << endl;
//		cout << "---------------------------------------" << endl;
//		while (rs->next())
//		{
//
//
//			cout.width(13);
//			cout.setf(ios::left);
//			cout << rs->getInt(1);
//			cout.unsetf(ios::left);
//
//			cout.width(15);
//			cout.setf(ios::left);
//			cout << rs->getString(2);
//			cout.unsetf(ios::left);
//
//			cout.width(10);
//			cout.setf(ios::left);
//			cout << rs->getString(3);
//			cout.unsetf(ios::left);
//			cout << endl;
//		}
//
//
//		conn->terminateStatement(stmt);
//		env->terminateConnection(conn);
//		Environment::terminateEnvironment(env);
//	}
//	catch (SQLException& sqlExcp)
//	{
//		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
//	}
//
//	return 0;
//}