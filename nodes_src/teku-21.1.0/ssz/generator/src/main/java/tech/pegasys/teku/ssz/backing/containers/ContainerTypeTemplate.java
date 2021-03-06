/*
 * Copyright 2020 ConsenSys AG.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
 * an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations under the License.
 */

package tech.pegasys.teku.ssz.backing.containers;

import java.util.List;
import java.util.function.BiFunction;
import tech.pegasys.teku.ssz.backing.ContainerViewRead;
import tech.pegasys.teku.ssz.backing.ViewRead;
import tech.pegasys.teku.ssz.backing.tree.TreeNode;
import tech.pegasys.teku.ssz.backing.type.ContainerViewType;
import tech.pegasys.teku.ssz.backing.type.ViewType;

/** Autogenerated by tech.pegasys.teku.ssz.backing.ContainersGenerator */
public abstract class /*$$TypeClassName*/ ContainerTypeTemplate /*$$*/<
        C extends ContainerViewRead, /*$$ViewTypes*/
        V1 extends ViewRead,
        V2 extends ViewRead /*$$*/>
    extends ContainerViewType<C> {

  public static <
          C extends ContainerViewRead, /*$$ViewTypes*/
          V1 extends ViewRead,
          V2 extends ViewRead /*$$*/>
      /*$$TypeClassName*/ ContainerTypeTemplate /*$$*/<C, /*$$ViewTypeNames*/ V1, V2 /*$$*/> create(
          /*$$FieldsDeclarations*/
          ViewType<V1> fieldType1,
          ViewType<V2> fieldType2 /*$$*/,
          BiFunction<
                  /*$$TypeClassName*/ ContainerTypeTemplate /*$$*/<
                      C, /*$$ViewTypeNames*/ V1, V2 /*$$*/>,
                  TreeNode,
                  C>
              instanceCtor) {
    return new /*$$TypeClassName*/ ContainerTypeTemplate /*$$*/<>(
        /*$$Fields*/ fieldType1, fieldType2 /*$$*/) {
      @Override
      public C createFromBackingNode(TreeNode node) {
        return instanceCtor.apply(this, node);
      }
    };
  }

  protected /*$$TypeClassName*/ ContainerTypeTemplate /*$$*/(
      /*$$FieldsDeclarations*/ ViewType<V1> fieldType1, ViewType<V2> fieldType2 /*$$*/) {

    super(List.of(/*$$Fields*/ fieldType1, fieldType2 /*$$*/));
  }
}
