# Define the database connection to be used for this model.
connection: "andresd_test"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: andresd_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: andresd_test_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Andresd Test"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: csvtest {}

explore: datos_personales {}

explore: federada_looker {}

explore: jsontest {}

explore: otros_datos {}

explore: jsoncompuesto {
  always_filter: {
    filters: [jsoncompuesto.user_id: "01d87940-33c5-e412-97dc-4325f3eb1c4e"]
  }
  join: jsoncompuesto__items {
    view_label: "Jsoncompuesto: Items"
    sql: LEFT JOIN UNNEST(${jsoncompuesto.items}) as jsoncompuesto__items ;;
    relationship: one_to_many
  }

  join: jsoncompuesto__event_params {
    view_label: "Jsoncompuesto: Event Params"
    sql: LEFT JOIN UNNEST(${jsoncompuesto.event_params}) as jsoncompuesto__event_params ;;
    relationship: one_to_many
  }

  join: jsoncompuesto__user_properties {
    view_label: "Jsoncompuesto: User Properties"
    sql: LEFT JOIN UNNEST(${jsoncompuesto.user_properties}) as jsoncompuesto__user_properties ;;
    relationship: one_to_many
  }
}

explore: jsonlookerdef {
  join: jsonlookerdef__items {
    view_label: "Jsonlookerdef: Items"
    sql: LEFT JOIN UNNEST(${jsonlookerdef.items}) as jsonlookerdef__items ;;
    relationship: one_to_many
  }

  join: jsonlookerdef__event_params {
    view_label: "Jsonlookerdef: Event Params"
    sql: LEFT JOIN UNNEST(${jsonlookerdef.event_params}) as jsonlookerdef__event_params ;;
    relationship: one_to_many
  }

  join: jsonlookerdef__user_properties {
    view_label: "Jsonlookerdef: User Properties"
    sql: LEFT JOIN UNNEST(${jsonlookerdef.user_properties}) as jsonlookerdef__user_properties ;;
    relationship: one_to_many
  }
}

explore: tablaspanner {}

explore: test2 {}

explore: tabla_iver {}

explore: tweeps {}

explore: testspanner3 {}

explore: testspanner {}

explore: jsontest1 {}

explore: testspanner2 {}
