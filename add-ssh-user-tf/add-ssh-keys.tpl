{
    "schemaVersion": "2.2",
    "description": "Add SSH public keys to authorized_keys",
    "mainSteps": [
        {
            "action": "aws:runShellScript",
            "name": "addSSHKeys",
            "inputs": {
                "runCommand": ["${run_commands}"]
            }
        }
    ]
}