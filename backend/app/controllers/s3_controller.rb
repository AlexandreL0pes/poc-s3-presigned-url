# frozen_string_literal: true
require 'aws-sdk-s3'

class S3Controller < ApplicationController
  BUCKET_NAME = "files"

  def presigned_url
    signer = Aws::S3::Presigner.new(client: aws_client)

    url = signer.presigned_url(
      :put_object,
      bucket: BUCKET_NAME,
      key: "#{SecureRandom.uuid}",
    )
    render json: { url: url }, status: :ok
  end

  def photos
    objects = aws_client("http://localstack:4566").list_objects_v2(
      bucket: BUCKET_NAME,
      max_keys: 100,
    ).contents

    keys = objects.map(&:key)
    render json: { photos: keys }, status: :ok
  end

  private

  def aws_client(endpoint = "http://localhost:4566")
    options = {
      region: 'us-east-1',
      access_key_id: '123',
      secret_access_key: '123',
    }
    options.merge!(endpoint: endpoint, force_path_style: true) if Rails.env.development?

    Aws::S3::Client.new(options)
  end
end
