name "elasticsearch"
description "Base role applied to elasticsearch nodes."
attr = {
  kibana: {
    webserver_port: 5061
  }
}
default_attributes(attr)
run_list("recipe[kibana]")
