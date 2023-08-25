####################################################################
# EFS for FS sharing
####################################################################
resource "aws_efs_file_system" "efs" {
  creation_token = "${var.prefix}-${var.environment}-efs"
  tags = var.tags
}

resource "aws_efs_mount_target" "efs_target" {
  for_each = toset(module.vpc.private_subnets)
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = each.value
  security_groups = [module.efs_sg.security_group_id]
}
