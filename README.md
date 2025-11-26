# HuaweiCloud OBS Terraform Module

Terraform module which creates OBS (Object Storage Service) bucket on Huawei Cloud.

## Features

This module supports the following OBS bucket features:

- ✅ Basic bucket configuration (ACL, storage class, versioning, tags)
- ✅ Server-side encryption (AES256 and KMS)
- ✅ Bucket policies (OBS and S3 format)
- ✅ Lifecycle rules
- ✅ CORS rules
- ✅ Access logging
- ✅ Static website hosting
- ✅ Multi-AZ redundancy
- ✅ Enterprise project management
- ✅ Storage quota

## Examples

- [basic](./examples/basic) - Basic bucket with versioning and encryption
- [with-policy](./examples/with-policy) - Bucket with policy (OBS and S3 format)
- [with-lifecycle](./examples/with-lifecycle) - Bucket with lifecycle rules
- [with-cors](./examples/with-cors) - Bucket with CORS configuration
- [with-logging](./examples/with-logging) - Bucket with access logging
- [with-website](./examples/with-website) - Static website hosting
- [with-multi-az](./examples/with-multi-az) - Multi-AZ redundancy for production
- [with-quota](./examples/with-quota) - Bucket with storage quota

## Known Limitations / Roadmap

The following features are **not yet implemented** but are planned for future releases:

### Planned Features

- [ ] **Cross-Region Replication** - Automatic replication to different regions for disaster recovery
  - Resource: [`huaweicloud_obs_bucket_replication`](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/obs_bucket_replication)
- [ ] **Custom Domain Names** (`user_domain_names`) - Bind custom domains to buckets (requires DNS CNAME configuration)
  - Documentation: [`huaweicloud_obs_bucket` - user_domain_names](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/obs_bucket#user_domain_names)
- [ ] **Parallel File System** (`parallel_fs`) - High-performance mode for HPC/Big Data workloads
  - Documentation: [`huaweicloud_obs_bucket` - parallel_fs](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/obs_bucket#parallel_fs)
