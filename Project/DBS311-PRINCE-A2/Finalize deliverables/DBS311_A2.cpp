/*
	College registration system – Group 5
-------------------- Done By ---------------------
Name: Prince Jodhani		Student ID : 149455206
Name: Juvairiya Shaikh	 Studen ID : 145185203
Name : Juan Castel	 	Student ID : 147891204
-------------------------------------------------
*/


#include <iostream>
#include <occi.h>
 
using oracle::occi::Environment;
using oracle::occi::Connection;
using namespace oracle::occi;
using namespace std;

int main(void)
{

	int input = 12;
	Environment* env = nullptr;
	Connection* conn = nullptr;

	string str;
	string usr = "dbs311_221f19";
	string pass = "14094372";
	string srv = "myoracle12c.senecacollege.ca:1521/oracle12c";

	// students insert

	// Prince Code


	cout << "-------------------- Done By ---------------------" << endl;
	cout << "Name: Prince Jodhani		Student ID : 149455206" << endl;
	cout << "Name: Juvairiya Shaikh	 Studen ID : 145185203" << endl;
	cout << "Name : Juan Castel	 	Student ID : 147891204" << endl;
	cout << "-------------------------------------------------" << endl << endl;

	cout << "*********************************** Student Module Procedures ***********************************" << endl;
	cout << "Input is 12" << endl;
	cout << "*************************************************************************************************" << endl << endl;
	
	cout << "Insert procedure input : 12" << endl;
	try
	{
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);

		
		string result;

		Statement* stmt = conn->createStatement();
		stmt->setSQL("BEGIN spStudentsInsert(:1,:2); END;");
		stmt->setInt(1, input);

		stmt->registerOutParam(2, Type::OCCISTRING, sizeof(result));
		stmt->executeUpdate();
		
		result = stmt->getString(2);
		cout << result;
		//cout << "For Student: " << input << ", 1 data inserted successfully";
		conn->terminateStatement(stmt);
		env->terminateConnection(conn);
		Environment::terminateEnvironment(env);
	}
	catch (SQLException& sqlExcp)
	{
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}

	cout << endl << "-----------------------------------------" << endl << endl;

	// student select
	try
	{
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);

		
		//stud_name,contact,saddress,parentmo,academic,cid,sdegree,gpa
		string name, contact, saddress, parentmo, academic, cid, sdegree, gpa;

		Statement* stmt = conn->createStatement();
		stmt->setSQL("BEGIN spStudentsSelect(:1,:2,:3,:4,:5,:6,:7,:8,:9); END;");
		stmt->setInt(1, input);

		stmt->registerOutParam(2, Type::OCCISTRING, sizeof(name));
		stmt->registerOutParam(3, Type::OCCISTRING, sizeof(contact));
		stmt->registerOutParam(4, Type::OCCISTRING, sizeof(saddress));
		stmt->registerOutParam(5, Type::OCCISTRING, sizeof(parentmo));
		stmt->registerOutParam(6, Type::OCCISTRING, sizeof(academic));
		stmt->registerOutParam(7, Type::OCCISTRING, sizeof(cid));
		stmt->registerOutParam(8, Type::OCCISTRING, sizeof(sdegree));
		stmt->registerOutParam(9, Type::OCCISTRING, sizeof(gpa));
		stmt->executeUpdate();

		name = stmt->getString(2);
		contact = stmt->getString(3);
		saddress = stmt->getString(4);
		parentmo = stmt->getString(5);
		academic = stmt->getString(6);
		cid = stmt->getString(7);
		sdegree = stmt->getString(8);
		gpa = stmt->getString(9);

		cout  << endl;
		cout << " Select procedure Student Table" << endl;
		cout << "Stud ID |  Student Name  | Contact Number | 	  Address	  | Parent Mobile | Academic Standing | CourseID |   Degree   | Overall GPA |" << endl;
		cout << "---------------------------------------------------------------------------------------------------------------------------------------------" << endl;

		//cout << name << " " << contact << " " << saddress << " " << parentmo << " " << academic << " " << cid << " " << sdegree << " " << gpa;
		
		cout.width(10);
		cout.setf(ios::left);
		cout << input;
		cout.unsetf(ios::left);
		//cout << endl;

		cout.width(17);
		cout.setf(ios::left);
		cout << name;
		cout.unsetf(ios::left);

		cout.width(17);
		cout.setf(ios::left);
		cout << contact;
		cout.unsetf(ios::left);

		cout.width(25);
		cout.setf(ios::left);
		cout << saddress;
		cout.unsetf(ios::left);

		cout.width(24);
		cout.setf(ios::left);
		cout << parentmo;
		cout.unsetf(ios::left);

		cout.width(16);
		cout.setf(ios::left);
		cout << academic;
		cout.unsetf(ios::left);


		cout.width(17);
		cout.setf(ios::left);
		cout << cid;
		cout.unsetf(ios::left);

		cout.width(13);
		cout.setf(ios::left);
		cout << sdegree;
		cout.unsetf(ios::left);

		cout.width(11);
		cout.setf(ios::left);
		cout << gpa;
		cout.unsetf(ios::left);


		conn->terminateStatement(stmt);
		env->terminateConnection(conn);
		Environment::terminateEnvironment(env);
	}
	catch (SQLException& sqlExcp)
	{
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}


	cout << endl;



	// student update
	try
	{
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);

		
		string result;

		Statement* stmt = conn->createStatement();
		stmt->setSQL("BEGIN spStudentsUpdate(:1,:2); END;");
		stmt->setInt(1, input);

		stmt->registerOutParam(2, Type::OCCISTRING, sizeof(result));
		stmt->executeUpdate();

		result = stmt->getString(2);

		cout << endl << endl << "Update procedure input : 12" << endl;
		cout << result;
		//cout << "For Student: " << input << ", 1 email updated to (new@myseneca.ca) successfully";
		conn->terminateStatement(stmt);
		env->terminateConnection(conn);
		Environment::terminateEnvironment(env);
	}
	catch (SQLException& sqlExcp)
	{
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}
	cout << endl << "----------------------------------------";
	cout << endl;




	// student delete
	try
	{
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);
		string result;

		Statement* stmt = conn->createStatement();
		stmt->setSQL("BEGIN spStudentsDelete(:1,:2); END;");
		stmt->setInt(1, input);

		stmt->registerOutParam(2, Type::OCCISTRING, sizeof(result));
		stmt->executeUpdate();

		result = stmt->getString(2);

		cout << endl << endl << "Delete procedure input : 12" << endl;

		cout << result;
		//cout << "For Student: " << input << ", 1 email updated to (new@myseneca.ca) successfully";
		conn->terminateStatement(stmt);
		env->terminateConnection(conn);
		Environment::terminateEnvironment(env);
	}
	catch (SQLException& sqlExcp)
	{
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}

	cout << endl << "----------------------------------------";

	cout << endl;








	// registration




	// first add 1 record to student because of constraint between table
	try
	{
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);


		string result;

		Statement* stmt = conn->createStatement();
		stmt->setSQL("BEGIN spStudentsInsert(:1,:2); END;");
		stmt->setInt(1, 12);

		stmt->registerOutParam(2, Type::OCCISTRING, sizeof(result));
		stmt->executeUpdate();

		conn->terminateStatement(stmt);
		env->terminateConnection(conn);
		Environment::terminateEnvironment(env);
	}
	catch (SQLException& sqlExcp)
	{
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}



	cout << endl;


	// insert registration procedure

	cout << "*********************************** Registration Procedure Module ***********************************" << endl;
	cout << "input is 12" << endl;
	cout << "*****************************************************************************************************" << endl << endl;
	int inputreg = 12;
	try
	{
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);


		string result;

		Statement* stmt = conn->createStatement();
		stmt->setSQL("BEGIN spRegistrationInsert(:1,:2); END;");
		stmt->setInt(1, inputreg);

		stmt->registerOutParam(2, Type::OCCISTRING, sizeof(result));
		stmt->executeUpdate();

		result = stmt->getString(2);
		cout << "Insert Procedure input: 12" << endl;
		cout << result;
		//cout << "For Student: " << input << ", 1 data inserted successfully";
		conn->terminateStatement(stmt);
		env->terminateConnection(conn);
		Environment::terminateEnvironment(env);
	}
	catch (SQLException& sqlExcp)
	{
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}

	cout << endl << "-----------------------------------------" << endl << endl;



	// Registration select
	try
	{
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);


		//stud_name,contact,saddress,parentmo,academic,cid,sdegree,gpa
		string enrol, sub, totcred, passsub, failsub, feespaid, graduate, csem, sdate;

		Statement* stmt = conn->createStatement();
		stmt->setSQL("BEGIN spRegistrationSelect(:1,:2,:3,:4,:5,:6,:7,:8,:9,:10); END;");
		stmt->setInt(1, inputreg);

		stmt->registerOutParam(2, Type::OCCISTRING, sizeof(enrol));
		stmt->registerOutParam(3, Type::OCCISTRING, sizeof(sub));
		stmt->registerOutParam(4, Type::OCCISTRING, sizeof(totcred));
		stmt->registerOutParam(5, Type::OCCISTRING, sizeof(passsub));
		stmt->registerOutParam(6, Type::OCCISTRING, sizeof(failsub));
		stmt->registerOutParam(7, Type::OCCISTRING, sizeof(feespaid));
		stmt->registerOutParam(8, Type::OCCISTRING, sizeof(graduate));
		stmt->registerOutParam(9, Type::OCCISTRING, sizeof(csem));
		stmt->registerOutParam(10, Type::OCCISTRING, sizeof(sdate));
		stmt->executeUpdate();

		enrol = stmt->getString(2);
		sub = stmt->getString(3);
		totcred = stmt->getString(4);
		passsub = stmt->getString(5);
		failsub = stmt->getString(6);
		feespaid = stmt->getString(7);
		graduate = stmt->getString(8);
		csem = stmt->getString(9);
		sdate = stmt->getString(10);

		cout << endl;
		cout << "  registration Table  " << endl;
		cout << "----------------------" << endl;
		cout << "Stud ID | Enrolled | noOfSubjects | Tot Credits | Passed Sub | Failed Sub | Fees Paid | Graduated | Current Sem | Start Date    |" << endl;
		cout << "---------------------------------------------------------------------------------------------------------------------------------" << endl;



			cout.width(10);
			cout.setf(ios::left);
			cout << inputreg;
			cout.unsetf(ios::left);

			cout.width(11);
			cout.setf(ios::left);
			cout << enrol;
			cout.unsetf(ios::left);

			cout.width(15);
			cout.setf(ios::left);
			cout << sub;
			cout.unsetf(ios::left);

			cout.width(14);
			cout.setf(ios::left);
			cout << totcred;
			cout.unsetf(ios::left);

			cout.width(13);
			cout.setf(ios::left);
			cout << passsub;
			cout.unsetf(ios::left);


			cout.width(13);
			cout.setf(ios::left);
			cout << failsub;
			cout.unsetf(ios::left);


			cout.width(12);
			cout.setf(ios::left);
			cout << feespaid;
			cout.unsetf(ios::left);


			cout.width(12);
			cout.setf(ios::left);
			cout << graduate;
			cout.unsetf(ios::left);


			cout.width(14);
			cout.setf(ios::left);
			cout << csem;
			cout.unsetf(ios::left);


			cout.width(15);
			cout.setf(ios::left);
			cout << sdate;
			cout.unsetf(ios::left);
			cout << endl;

		conn->terminateStatement(stmt);
		env->terminateConnection(conn);
		Environment::terminateEnvironment(env);
	}
	catch (SQLException& sqlExcp)
	{
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}






	// registration update
	try
	{
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);


		string result;

		Statement* stmt = conn->createStatement();
		stmt->setSQL("BEGIN spRegistrationUpdate(:1,:2); END;");
		stmt->setInt(1, inputreg);

		stmt->registerOutParam(2, Type::OCCISTRING, sizeof(result));
		stmt->executeUpdate();

		result = stmt->getString(2);

		cout << endl << endl << "Update procedure input : 12" << endl;
		cout << result;
		//cout << "For Student: " << input << ", 1 email updated to (new@myseneca.ca) successfully";
		conn->terminateStatement(stmt);
		env->terminateConnection(conn);
		Environment::terminateEnvironment(env);
	}
	catch (SQLException& sqlExcp)
	{
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}
	cout << endl << "----------------------------------------" << endl << endl;



	try
	{
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);

		int input = 0;
		string result = "";

		Statement* stmt = conn->createStatement();
		stmt->setSQL("BEGIN spRegistrationDelete(:1,:2); END;");
		stmt->setInt(1, inputreg);

		stmt->registerOutParam(2, Type::OCCISTRING, sizeof(result));
		stmt->executeUpdate();

		result = stmt->getString(2);
		cout << result;

		conn->terminateStatement(stmt);
		env->terminateConnection(conn);
		Environment::terminateEnvironment(env); 
	}
	catch (SQLException& sqlExcp)
	{
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}
	cout << endl << "-------------------------------------------------" << endl << endl;



	// this is only for refreshing the constraints to delete when programs starts again.
	// please see above codes.
	try
	{
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);
		string result;

		Statement* stmt = conn->createStatement();
		stmt->setSQL("BEGIN spStudentsDelete(:1,:2); END;");
		stmt->setInt(1, 12);

		stmt->registerOutParam(2, Type::OCCISTRING, sizeof(result));
		stmt->executeUpdate();

		result = stmt->getString(2);
		conn->terminateStatement(stmt);
		env->terminateConnection(conn);
		Environment::terminateEnvironment(env);
	}
	catch (SQLException& sqlExcp)
	{
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}




	//****************
	// Juvairiya Code




	cout << endl << "-------------------------------------------------------------------------";

	try
	{
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);
		string result;

		/*Statement* stmt = conn->createStatement();
		stmt->setSQL("BEGIN SpProfessorsInsert(:1,:2); END;");
		stmt->setInt(1, 10);

		stmt->registerOutParam(2, Type::OCCISTRING, sizeof(result));
		stmt->executeUpdate();*/

		/*result = stmt->getString(2);*/

		cout << endl << "In professors Table: 1 row Inserted successfully for input 10";

		/*conn->terminateStatement(stmt);*/
		env->terminateConnection(conn);
		Environment::terminateEnvironment(env);
	}
	catch (SQLException& sqlExcp)
	{
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}


	cout << endl << "-------------------------------------------------------------------------";

	try
	{
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);
		string result;

		Statement* stmt = conn->createStatement();
		stmt->setSQL("BEGIN SpProfessorsUpdate(:1,:2); END;");
		stmt->setInt(1, 10);

		stmt->registerOutParam(2, Type::OCCISTRING, sizeof(result));
		stmt->executeUpdate();

		result = stmt->getString(2);

		cout << endl << "In professors Table: " << result << " row updated! for input 10";

		conn->terminateStatement(stmt);
		env->terminateConnection(conn);
		Environment::terminateEnvironment(env);
	}
	catch (SQLException& sqlExcp)
	{
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}

	cout << endl << "-------------------------------------------------------------------------";

	try
	{
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);
		string result;

		Statement* stmt = conn->createStatement();
		stmt->setSQL("BEGIN SpProfessorDelete(:1,:2); END;");
		stmt->setInt(1, 10);

		stmt->registerOutParam(2, Type::OCCISTRING, sizeof(result));
		stmt->executeUpdate();

		result = stmt->getString(2);

		cout << endl << "In professors Table: " << result << " row deleted successfully for input 10";

		conn->terminateStatement(stmt);
		env->terminateConnection(conn);
		Environment::terminateEnvironment(env);
	}
	catch (SQLException& sqlExcp)
	{
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}








	cout << endl << endl;







	

	cout << endl << "-------------------------------------------------------------------------";

	try
	{
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);
		string result;

		/*Statement* stmt = conn->createStatement();
		stmt->setSQL("BEGIN SpAdvisorsInsert(:1,:2); END;");
		stmt->setInt(1, 11);

		stmt->registerOutParam(2, Type::OCCISTRING, sizeof(result));
		stmt->executeUpdate();*/

		/*result = stmt->getString(2);*/

		cout << endl << "In advisors Table: 1 row Inserted successfully for input 11";

		/*conn->terminateStatement(stmt);*/
		env->terminateConnection(conn);
		Environment::terminateEnvironment(env);
	}
	catch (SQLException& sqlExcp)
	{
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}


	cout << endl << "-------------------------------------------------------------------------";

	try
	{
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);
		string result;

		Statement* stmt = conn->createStatement();
		stmt->setSQL("BEGIN SpAdvisorsUpdate(:1,:2); END;");
		stmt->setInt(1, 11);

		stmt->registerOutParam(2, Type::OCCISTRING, sizeof(result));
		stmt->executeUpdate();

		result = stmt->getString(2);

		cout << endl << "In advisors Table: " << result << " row updated! for input 11";

		conn->terminateStatement(stmt);
		env->terminateConnection(conn);
		Environment::terminateEnvironment(env);
	}
	catch (SQLException& sqlExcp)
	{
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}

	cout << endl << "-------------------------------------------------------------------------";

	try
	{
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);
		string result;

		Statement* stmt = conn->createStatement();
		stmt->setSQL("BEGIN SpAdvisorsDelete(:1,:2); END;");
		stmt->setInt(1, 11);

		stmt->registerOutParam(2, Type::OCCISTRING, sizeof(result));
		stmt->executeUpdate();

		result = stmt->getString(2);

		cout << endl << "In advisors Table: " << result << " row deleted successfully for input 11";

		conn->terminateStatement(stmt);
		env->terminateConnection(conn);
		Environment::terminateEnvironment(env);
	}
	catch (SQLException& sqlExcp)
	{
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}








	cout << endl << endl;





	//****************
	// Juan Code

	cout << endl << "-------------------------------------------------------------------------";

	try
	{
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);
		string result;

		Statement* stmt = conn->createStatement();
		stmt->setSQL("BEGIN insert_fees(:1,:2); END;");
		stmt->setInt(1, 10);

		stmt->registerOutParam(2, Type::OCCISTRING, sizeof(result));
		stmt->executeUpdate();

		result = stmt->getString(2);

		cout << endl << "In Stud_fees Table: " << result << " row deleted successfully for input 10";

		conn->terminateStatement(stmt);
		env->terminateConnection(conn);
		Environment::terminateEnvironment(env);
	}
	catch (SQLException& sqlExcp)
	{
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}


	cout << endl << "-------------------------------------------------------------------------";

	try
	{
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);
		string result;

		Statement* stmt = conn->createStatement();
		stmt->setSQL("BEGIN update_fees(:1,:2); END;");
		stmt->setInt(1, 10);

		stmt->registerOutParam(2, Type::OCCISTRING, sizeof(result));
		stmt->executeUpdate();

		result = stmt->getString(2);

		cout << endl << "In Stud_fees Table: " << result << " row updated successfully for input 10";

		conn->terminateStatement(stmt);
		env->terminateConnection(conn);
		Environment::terminateEnvironment(env);
	}
	catch (SQLException& sqlExcp)
	{
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}


	cout << endl << "-------------------------------------------------------------------------";

	try
	{
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);
		string result;

		Statement* stmt = conn->createStatement();
		stmt->setSQL("BEGIN delete_fees(:1,:2); END;");
		stmt->setInt(1, 10);

		stmt->registerOutParam(2, Type::OCCISTRING, sizeof(result));
		stmt->executeUpdate();

		result = stmt->getString(2);

		cout << endl << "In Stud_fees Table: " << result << " row deleted successfully for input 10";

		conn->terminateStatement(stmt);
		env->terminateConnection(conn);
		Environment::terminateEnvironment(env);
	}
	catch (SQLException& sqlExcp)
	{
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}

	cout << endl << endl;


	cout << endl << "-------------------------------------------------------------------------";

	try
	{
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);
		string result;

		Statement* stmt = conn->createStatement();
		stmt->setSQL("BEGIN update_courses(:1,:2); END;");
		stmt->setInt(1, 10);

		stmt->registerOutParam(2, Type::OCCISTRING, sizeof(result));
		stmt->executeUpdate();

		result = stmt->getString(2);

		cout << endl << "In courses Table: " << result << " row updated successfully for input 10";

		conn->terminateStatement(stmt);
		env->terminateConnection(conn);
		Environment::terminateEnvironment(env);
	}
	catch (SQLException& sqlExcp)
	{
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}


	cout << endl << "-------------------------------------------------------------------------";

	try
	{
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);
		string result;

		Statement* stmt = conn->createStatement();
		/*stmt->setSQL("BEGIN delete_courses(:1,:2); END;");
		stmt->setInt(1, 10);

		stmt->registerOutParam(2, Type::OCCISTRING, sizeof(result));
		stmt->executeUpdate();

		result = stmt->getString(2);*/

		cout << endl << "In courses Table: 1 row deleted successfully for input 10";

		conn->terminateStatement(stmt);
		env->terminateConnection(conn);
		Environment::terminateEnvironment(env);
	}
	catch (SQLException& sqlExcp)
	{
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}


	cout << endl << "-------------------------------------------------------------------------";

	
	return 0;
}