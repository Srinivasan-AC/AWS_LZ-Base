output "relationship_status" {
  description = "Status of this delegated admin account."
  value       = aws_inspector2_delegated_admin_account.delegated_admin_account[*].relationship_status
}

output "delegated_admin_account_id" {
  description = "Account ID of the delegated administrator account"
  value       = aws_inspector2_member_association.member_association[*].delegated_admin_account_id
}

output "relationship_status_member_association" {
  description = "Status of the member relationship"
  value       = aws_inspector2_member_association.member_association[*].relationship_status
}

output "updated_at" {
  description = "Status of the member relationship"
  value       = aws_inspector2_member_association.member_association[*].updated_at
}

 
 