dataSource {
	pooled = true
	driverClassName = "com.mysql.jdbc.Driver"
	username = "yosydb_user"
	password = "Yos!2011"
	dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
		dbCreate = "create-drop"
 }
 // environment specific settings
 environments {
		development {
				dataSource {
						dbCreate = "update"//"create-drop" // one of 'create', 'create-drop','update'
						url = "jdbc:mysql://ec2-75-101-156-134.compute-1.amazonaws.com:3306/yosydb"
				}
		}
		test {
				dataSource {
						dbCreate = "update"
						url = "jdbc:mysql://ec2-75-101-156-134.compute-1.amazonaws.com:3306/yosydb"
				}
		}
		production {
				dataSource {
						dbCreate = "update"
						url = "jdbc:mysql://ec2-75-101-156-134.compute-1.amazonaws.com:3306/yosydb"
				}
		}
 }