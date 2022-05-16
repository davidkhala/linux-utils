install(){
    ## silent mode
    bash -c "$(curl -L https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh)" -- --accept-all-defaults
    # In what directory would you like to place the install? (leave blank to use '$HOME/lib/oracle-cli')
    # In what directory would you like to place the 'oci' executable? (leave blank to use '$HOME/bin')
    # In what directory would you like to place the OCI scripts? (leave blank to use '$HOME/bin/oci-cli-scripts')

}
$@
