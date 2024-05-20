#!/usr/bin/env bash

/bin/ln -f scripts/amd64.sh ../bento/packer_templates/scripts/ubuntu/homestead_amd64.sh
/bin/ln -f scripts/arm.sh ../bento/packer_templates/scripts/ubuntu/homestead_arm.sh

echo " " > ../bento/packer_templates/scripts/_common/motd.sh

sed -i.bak 's/${var.os_name}\/cleanup_${var.os_name}.sh/ubuntu\/homestead_amd64.sh/' ../bento/packer_templates/pkr-builder.pkr.hcl; rm -f ../bento/packer_templates/*.bak
# Set disk_size
sed -i.bak 's/65536/524288/' ../bento/packer_templates/pkr-variables.pkr.hcl; rm -f ../bento/packer_templates/*.bak
