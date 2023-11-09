data "aws_iam_policy_document" "assume_role" {
  count = length(keys(var.principals))

  statement {
    effect  = "Allow"
    actions = [var.assume_role_action]

    principals {
      type        = element(keys(var.principals), count.index)
      identifiers = var.principals[element(keys(var.principals), count.index)]
    }
  }
}

data "aws_iam_policy_document" "assume_role_aggregated" {
  count                     = var.enabled_iam_role ? 1 : 0
  override_policy_documents = data.aws_iam_policy_document.assume_role.*.json
}


resource "aws_iam_role" "default" {
  count                = var.enabled_iam_role ? 1 : 0
  name                 = var.iam_role_name
  assume_role_policy   = join("", data.aws_iam_policy_document.assume_role_aggregated.*.json)
  description          = var.role_description
  max_session_duration = var.max_session_duration
  tags                 = var.tags
}

data "aws_iam_policy_document" "default" {
  count                     = var.enabled_iam_role && var.policy_document_count > 0 ? 1 : 0
  override_policy_documents = var.policy_documents
}


resource "aws_iam_policy" "default" {
  count       = var.enabled_iam_role && var.policy_document_count > 0 ? 1 : 0
  name        = var.iam_policy_name
  description = var.policy_description
  policy      = join("", data.aws_iam_policy_document.default.*.json)
}

resource "aws_iam_role_policy_attachment" "default" {
  count      = var.enabled_iam_role && var.policy_document_count > 0 ? 1 : 0
  role       = join("", aws_iam_role.default.*.name)
  policy_arn = join("", aws_iam_policy.default.*.arn)
}
