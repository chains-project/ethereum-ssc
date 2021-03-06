/*
 * Copyright ConsenSys AG.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
 * an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 */
package org.hyperledger.besu.tests.acceptance.dsl.privacy.transaction;

import org.hyperledger.besu.tests.acceptance.dsl.privacy.PrivacyNode;
import org.hyperledger.besu.tests.acceptance.dsl.transaction.NodeRequests;
import org.hyperledger.besu.tests.acceptance.dsl.transaction.Transaction;
import org.hyperledger.besu.tests.acceptance.dsl.transaction.privacy.PrivacyRequestFactory.PrivxCreatePrivacyGroupResponse;

import java.io.IOException;
import java.util.List;

public class CreateOnchainPrivacyGroupTransaction
    implements Transaction<PrivxCreatePrivacyGroupResponse> {
  private final PrivacyNode creator;
  private final List<String> addresses;
  private final String privateFrom;

  CreateOnchainPrivacyGroupTransaction(
      final PrivacyNode creator, final String privateFrom, final List<String> addresses) {
    this.creator = creator;
    this.addresses = addresses;
    this.privateFrom = privateFrom;
  }

  @Override
  public PrivxCreatePrivacyGroupResponse execute(final NodeRequests node) {
    try {
      return node.privacy().privxCreatePrivacyGroup(creator, privateFrom, addresses);
    } catch (final IOException e) {
      throw new RuntimeException(e);
    }
  }
}
