/** *******************************************************************************************************************
  Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.

  Licensed under the Apache License, Version 2.0 (the "License").
  You may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
 ******************************************************************************************************************** */

const shuffle = (array: any[]) => {
  const resultArray = [...array];
  
  let currentIndex = array.length;
  let randomIndex;

  while (currentIndex !== 0) {
    randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex--;

    const temp = resultArray[currentIndex];
    /* eslint-disable @typescript-eslint/no-unused-expressions */
    resultArray[currentIndex] = resultArray[randomIndex];
    /* eslint-enable @typescript-eslint/no-unused-expressions */
    resultArray[randomIndex] = temp;
  }

  return resultArray;
};

export default shuffle;
