package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformBasic(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../env/preprod", // 👈 YAHI FIX HAI
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
}
