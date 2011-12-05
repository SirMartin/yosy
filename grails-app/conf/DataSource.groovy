dataSource {
	pooled = true
	driverClassName = "com.mysql.jdbc.Driver"
	username = "yosyjvm_user"
	password = "Yos!2011"
	dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
		dbCreate = "update"
 }
 // environment specific settings
 environments {
		development {
				dataSource {
						dbCreate = "update"//"create-drop" // one of 'create', 'create-drop','update'
						url = "jdbc:mysql://88.198.66.216:3306/yosyjvm_yosydb"
				}
		}
		test {
				dataSource {
						dbCreate = "update"
						url = "jdbc:mysql://88.198.66.216:3306/yosyjvm_yosydb"
				}
		}
		production {
				dataSource {
						dbCreate = "update"
						url = "jdbc:mysql://88.198.66.216:3306/yosyjvm_yosydb"
				}
		}
 }