USE Restaurant_Delivery_Database;

SELECT Staff.employeeID AS 'Employee ID', concat(fName, ' ', lName) AS 'Driver Names'
FROM Staff JOIN Driver ON Staff.employeeID = Driver.employeeID
Order BY lName;
/*Select Statement which takes in the first and last names and employeeIDs of the Staff Table and displays them under Titles: Employee ID and Driver Names.
Join Statement means that the only Names that are returned are the names that are linked to the employeeIDs that are in both the Staff and Driver Tables.
Therefore, this Statement returns the employeeID and full names of the Drivers. Results are ordered by lName*/

SELECT orderNumber AS 'Vegeterian Orders' FROM composedOf
WHERE ingredientsCode LIKE 'C%'
ORDER BY orderNumber;
/*Select Statement which takes in the orderNumber from composedOf table
and displays the orderNumbers where the corresponding ingredientsCode begins with C as all vegetable ingredientsCodes begin with C.
Displays them as Vegetarian Orders and ordered from earliest orderNumber to most recent.*/

SELECT AVG(weight) FROM OrderItem; -- Determines the Average Value of weight from the OrderItem Table

SELECT MAX(calorieAmount) FROM OrderItem
JOIN composedOf ON OrderItem.orderNumber = composedOf.orderNumber
WHERE ingredientsCode LIKE 'A%';
/*Determines the Maximum calorieAmount from an OrderItem where the Ingredient is a Spice.
Join Statement joins composed of and OrderItem where the orderNumber is equal on both tables
and where the ingredientsCode begins with A which is the first letter of all IngredientsCodes which are Spices.*/

SELECT COUNT(orderNumber) FROM `Order` -- Determines Number of Orders from a particular House.
WHERE houseIDNumber = '0082784';

SELECT houseIDNumber AS 'House' FROM `Order`
WHERE orderNumber =
	(SELECT orderNumber
    FROM OrderItem
    WHERE weight >= '2.90' );
/*Select Statement which takes in a Subquery. Determines the houseIDNumber from Order
where the orderNumber is equal to the orderNumber in OrderItem Table with a weight above 2.90 i.e. the heaviest order.
This determines which house ordered the largest order in terms of weight.*/

SELECT `Order`.orderNumber, Household.houseIDNumber, town FROM delivers
JOIN `Order` ON delivers.orderNumber = `Order`.orderNumber
JOIN Household ON `Order`.houseIDNumber = Household.houseIDNumber
WHERE distance > '12';
/*Select statement taking in orderNumber from Order, houseIDNumber from Household and town from Household
2 Join Statements are used to join the delivers table to the Order table to the Household table
Statement then displays the orderNumber, houseIDNumber and town where the distance is larger than 12.*/

SELECT employeeID, COUNT(employeeID) FROM delivers
GROUP BY employeeID;
/*Select Statement to count how many deliverys were made by each Driver.
Displays employeeID and number of deliveries - Group By command changes count to count per employee
instead of just counting all deliveries.*/

CREATE USER GeneralManager IDENTIFIED BY 'IaminCh4rg3'; -- Creates GeneralManager User and adds Password for Logging In

CREATE USER AssistantManager IDENTIFIED BY '2ndInC0mm4nd'; -- Creates AssistantManager User and adds Password for Logging In

CREATE USER Staff IDENTIFIED BY 'W0rk3rB33'; -- Creates Staff User and adds Password for Logging In

GRANT ALL ON Restaurant_Delivery_Database.* TO GeneralManager WITH GRANT OPTION; /*Grants Full Control of the Database to the GeneralManager User
and gives them the power to change the privileges of other Users.*/

GRANT SELECT ON Restaurant_Delivery_Database.* TO AssistantManager; /*Gives Privilege to AssistantManager User to allow them to
view all Tables with Read Access Only.*/

/*A Series of Grant Statements which gives the AssistantManager User Privileges to Insert, Update, Delete, Select on all tables which are not related to Staff
This means only the Manager can make any edits to the Staff Tables*/
GRANT INSERT, UPDATE, DELETE, SELECT ON Household TO AssistantManager;
GRANT INSERT, UPDATE, DELETE, SELECT ON Ingredients TO AssistantManager;
GRANT INSERT, UPDATE, DELETE, SELECT ON `Order` TO AssistantManager;
GRANT INSERT, UPDATE, DELETE, SELECT ON OrderCourse TO AssistantManager;
GRANT INSERT, UPDATE, DELETE, SELECT ON OrderItem TO AssistantManager;
GRANT INSERT, UPDATE, DELETE, SELECT ON composedOf TO AssistantManager;
GRANT INSERT, UPDATE, DELETE, SELECT ON creates TO AssistantManager;
GRANT INSERT, UPDATE, DELETE, SELECT ON delivers TO AssistantManager;

/*A Series of Grant Statements which gived Staff User Privileges to Insert, Update, Delete, Select on all tables which are not related to Staff.
The Staff User cannot have any interaction with the Staff Tables or View them.*/
GRANT INSERT, UPDATE, DELETE, SELECT ON Household TO Staff;
GRANT INSERT, UPDATE, DELETE, SELECT ON Ingredients TO Staff;
GRANT INSERT, UPDATE, DELETE, SELECT ON `Order` TO Staff;
GRANT INSERT, UPDATE, DELETE, SELECT ON OrderCourse TO Staff;
GRANT INSERT, UPDATE, DELETE, SELECT ON OrderItem TO Staff;
GRANT INSERT, UPDATE, DELETE, SELECT ON composedOf TO Staff;
GRANT INSERT, UPDATE, DELETE, SELECT ON creates TO Staff;
GRANT INSERT, UPDATE, DELETE, SELECT ON delivers TO Staff;

SHOW GRANTS FOR GeneralManager; -- Allows the User to view the current Privileges of the GeneralManagerUser
SHOW GRANTS FOR  AssistantManager; -- Allows the User to view the current Privileges of the AssistantManager User
SHOW GRANTS FOR Staff; -- Allows the User to view the current Privileges of the Staff User