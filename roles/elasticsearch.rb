name "elasticsearch"
description "Base role applied to elasticsearch nodes."
run_list(
  "recipe[java]",
  "recipe[elasticsearch]"
)
default_attributes(
  "java" => {
    "install_flavor" => "oracle",
    "jdk_version" => "7",
    "oracle" => {
      "accept_oracle_download_terms" => true
    }
  }
)
