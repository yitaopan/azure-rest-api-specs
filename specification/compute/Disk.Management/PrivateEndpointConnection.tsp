import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";
import "@typespec/openapi";
import "@typespec/rest";
import "./models.tsp";
import "./DiskAccess.tsp";

using TypeSpec.Rest;
using Azure.ResourceManager;
using TypeSpec.Http;
using TypeSpec.OpenAPI;

namespace Microsoft.Compute;
/**
 * The Private Endpoint Connection resource.
 */
@parentResource(DiskAccess)
model PrivateEndpointConnection
  is Azure.ResourceManager.ProxyResource<PrivateEndpointConnectionProperties> {
  ...ResourceNameParameter<
    Resource = PrivateEndpointConnection,
    KeyName = "privateEndpointConnectionName",
    SegmentName = "privateEndpointConnections",
    NamePattern = ""
  >;
}

@armResourceOperations
interface PrivateEndpointConnections {
  /**
   * Gets information about a private endpoint connection under a disk access resource.
   */
  #suppress "@azure-tools/typespec-azure-core/casing-style" "Respecting name of the operation"
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("DiskAccesses_GetAPrivateEndpointConnection")
  getAPrivateEndpointConnection is ComputeResourceRead<PrivateEndpointConnection>;

  /**
   * Approve or reject a private endpoint connection under disk access resource, this can't be used to create a new private endpoint connection.
   */
  #suppress "@azure-tools/typespec-azure-core/casing-style" "Respecting name of the operation"
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-put-operation-response-codes" "For backward compatibility"
  #suppress "@azure-tools/typespec-azure-resource-manager/no-response-body" "For backward compatibility"
  @operationId("DiskAccesses_UpdateAPrivateEndpointConnection")
  updateAPrivateEndpointConnection is ComputeResourceCreateOrReplaceAsync<
    PrivateEndpointConnection,
    Response = ArmResourceUpdatedResponse<PrivateEndpointConnection> | (ArmAcceptedLroResponse & {
      @bodyRoot _: PrivateEndpointConnection;
    })
  >;

  /**
   * Deletes a private endpoint connection under a disk access resource.
   */
  #suppress "@azure-tools/typespec-azure-core/casing-style" "Respecting name of the operation"
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  #suppress "deprecated" "For backward compatibility"
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-delete-operation-response-codes" "For backward compatibility"
  #suppress "@azure-tools/typespec-azure-core/no-response-body" "For backward compatibility"
  @operationId("DiskAccesses_DeleteAPrivateEndpointConnection")
  deleteAPrivateEndpointConnection is ComputeResourceDeleteAsync<PrivateEndpointConnection>;

  /**
   * List information about private endpoint connections under a disk access resource
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("DiskAccesses_ListPrivateEndpointConnections")
  listPrivateEndpointConnections is ComputeResourceListByParent<
    PrivateEndpointConnection,
    Response = PrivateEndpointConnectionListResult
  >;
}

@@doc(PrivateEndpointConnection.name,
  "The name of the private endpoint connection."
);
@@doc(PrivateEndpointConnection.properties, "Resource properties.");
@@doc(PrivateEndpointConnections.updateAPrivateEndpointConnection::parameters.resource,
  "private endpoint connection object supplied in the body of the Put private endpoint connection operation."
);
