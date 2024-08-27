# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Release")
  file(REMOVE_RECURSE
  "CMakeFiles/hmi_agf_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/hmi_agf_autogen.dir/ParseCache.txt"
  "CMakeFiles/hmi_agf_qds_components_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/hmi_agf_qds_components_autogen.dir/ParseCache.txt"
  "content/CMakeFiles/content_autogen.dir/AutogenUsed.txt"
  "content/CMakeFiles/content_autogen.dir/ParseCache.txt"
  "content/CMakeFiles/contentplugin_autogen.dir/AutogenUsed.txt"
  "content/CMakeFiles/contentplugin_autogen.dir/ParseCache.txt"
  "content/CMakeFiles/contentplugin_init_autogen.dir/AutogenUsed.txt"
  "content/CMakeFiles/contentplugin_init_autogen.dir/ParseCache.txt"
  "content/content_autogen"
  "content/contentplugin_autogen"
  "content/contentplugin_init_autogen"
  "hmi_agf_autogen"
  "hmi_agf_qds_components_autogen"
  )
endif()
