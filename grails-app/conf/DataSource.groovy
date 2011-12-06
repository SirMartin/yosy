dataSource {
	pooled = true
	driverClassName = "com.mysql.jdbc.Driver"
	username = "yosyjvm_user"
	password = "Yos!2011"
	dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
		dbCreate = "create-drop"
 }
 // environment specific settings
 environments {
		development {
				dataSource {
						dbCreate = "create-drop"//"create-drop" // one of 'create', 'create-drop','update'
						url = "jdbc:mysql://88.198.66.216:3306/yosyjvm_yosydb"
				}
		}
		test {
				dataSource {
						dbCreate = "create-drop"
						url = "jdbc:mysql://88.198.66.216:3306/yosyjvm_yosydb"
				}
		}
		production {
				dataSource {
						dbCreate = "create-drop"
						url = "jdbc:mysql://88.198.66.216:3306/yosyjvm_yosydb"
				}
		}
 }