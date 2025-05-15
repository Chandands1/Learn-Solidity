const fileNames = Array.from({ length: 100 }, (_, i) => {
  const num = i + 1;
  const prefix = num < 10 ? `0${num}` : num.toString();
  return `${prefix}-${getFileBaseName(num)}.sol`;
});

let currentIndex = 0;
let currentCode = "";

function getFileBaseName(index) {
  const baseNames = [
    "HelloWorld", "Counter", "Owner", "Greeting", "Calculator",
    "SimpleStorage", "BooleanSwitch", "SimpleEvent", "IndexedEvent", "RequireExample",
    "AssertExample", "RevertExample", "CustomError", "ViewPureFunctions", "SimpleLoop",
    "Conditional", "EtherUnits", "TimeUnits", "BlockInspector", "MsgInspector",
    "ArrayStorage", "DynamicArray", "StructDefinition", "StructArray", "SimpleMapping",
    "NestedMapping", "StructMapping", "EnumDefinition", "BytesStorage", "DynamicBytes",
    "StringStorage", "DataLocations", "ClearMapping", "ClearArray", "Packing",
    "PayableFunction", "ReceiveEther", "FallbackEther", "Withdrawal", "SimpleSplitter",
    "AddressMembers", "InterfaceUsage", "ContractCaller", "ContractCreator", "Create2Deployer",
    "LowLevelCall", "DelegateCall", "StaticCall", "TryCatchExternal", "TryCatchCreate",
    "SimpleERC20", "ERC20Mintable", "ERC20Burnable", "ERC20Approve", "SimpleERC721",
    "ERC721Mintable", "ERC721Enumerable", "ERC721Metadata", "ERC1155", "TokenSale",
    "Ownable", "Pausable", "ReentrancyGuard", "SimpleModifier", "ModifierWithArgs",
    "Inheritance", "MultipleInheritance", "SuperKeyword", "AbstractContract", "SimpleLibrary",
    "InternalLibrary", "TimeLock", "CommitReveal", "SimpleVoting", "BasicMultisig",
    "SimpleAuction", "DutchAuction", "MerkleProof", "SignatureVerification", "ProxyConcept",
    "UUPSProxy", "Factory", "SimpleOracle", "GasSaver", "ImmutableVariables",
    "ABIEncodeDecode", "EncodePacked", "EncodeWithSelector", "Hashing", "TypeInformation",
    "AssemblyReadSlot", "AssemblyWriteSlot", "AssemblyLoop", "AssemblyMemory", "TransientStorage",
    "Destructuring", "NamedParams", "PaymasterConcept", "MinimalProxy", "SelfDestruct"
  ];
  return baseNames[index - 1];
}

function loadSnippet(index) {
  const file = fileNames[index];
  const fileNumber = index + 1;
  fetch(`public/snippets/${file}`)
    .then(res => {
      if (!res.ok) throw new Error("File not found");
      return res.text();
    })
    .then(data => {
      currentCode = data.trim();
      document.getElementById("snippet-title").textContent = `${fileNumber}. ${file}`;
      document.getElementById("solidity-code").textContent = currentCode;
      document.getElementById("user-input").value = "";
      document.getElementById("feedback").textContent = "";
      document.getElementById("nextBtn").disabled = true;
    })
    .catch(err => {
      document.getElementById("snippet-title").textContent = `Error loading: ${file}`;
      document.getElementById("solidity-code").textContent = err.message;
    });
}

function normalize(text) {
  return text.replace(/\s+/g, '').trim();
}

function checkCode() {
  const userInput = document.getElementById("user-input").value;
  if (normalize(userInput) === normalize(currentCode)) {
    document.getElementById("feedback").textContent = "✅ Correct! You can proceed.";
    document.getElementById("feedback").style.color = "lightgreen";
    document.getElementById("nextBtn").disabled = false;
  } else {
    document.getElementById("feedback").textContent = "❌ Not matching. Please try again.";
    document.getElementById("feedback").style.color = "orange";
  }
}

function clearInput() {
  document.getElementById("user-input").value = "";
  document.getElementById("feedback").textContent = "";
  document.getElementById("nextBtn").disabled = true;
}

function nextSnippet() {
  if (currentIndex < fileNames.length - 1) {
    currentIndex++;
    loadSnippet(currentIndex);
  } else {
    document.getElementById("feedback").textContent = "🎉 All snippets completed!";
    document.getElementById("feedback").style.color = "cyan";
    document.getElementById("nextBtn").disabled = true;
  }
}

function prevSnippet() {
  if (currentIndex > 0) {
    currentIndex--;
    loadSnippet(currentIndex);
  }
}

function toggleTheme() {
  document.body.classList.toggle("light");
}

window.onload = () => loadSnippet(currentIndex);
