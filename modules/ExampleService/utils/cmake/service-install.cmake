configure_file(utils/service-installation-files/service.service ${CMAKE_CURRENT_BINARY_DIR}/services/${PROJECT_NAME}.service)
configure_file(utils/service-installation-files/start.sh ${CMAKE_CURRENT_BINARY_DIR}/services/start-${PROJECT_NAME}.sh )
configure_file(utils/service-installation-files/stop.sh ${CMAKE_CURRENT_BINARY_DIR}/services/stop-${PROJECT_NAME}.sh )

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/services/start-${PROJECT_NAME}.sh
        DESTINATION ${DIANA_MODULE_SERVICES_FOLDER}/${PROJECT_NAME}/services)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/services/stop-${PROJECT_NAME}.sh
        DESTINATION ${DIANA_MODULE_SERVICES_FOLDER}/${PROJECT_NAME}/services)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/services/${PROJECT_NAME}.service
        DESTINATION /etc/systemd/system/)

install(CODE "execute_process(COMMAND sudo chmod +x ${DIANA_SYSTEM_DIR_SVC}/${PROJECT_NAME}/services/start-${PROJECT_NAME}.sh)")
install(CODE "execute_process(COMMAND sudo chmod +x ${DIANA_SYSTEM_DIR_SVC}/${PROJECT_NAME}/services/stop-${PROJECT_NAME}.sh)")
install(CODE "execute_process(COMMAND sudo systemctl enable ${PROJECT_NAME}.service)")
install(CODE "execute_process(COMMAND sudo systemctl daemon-reload)")


# DIANA-Template Cpp - 2023
# Crafted with <3 and some >:( by Thomas Galliano
