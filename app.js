
let syllables = [];
let currentIndex = 0;

function splitWord(word) {
  const vowels = "aeiouàèéìòùAEIOU";
  let result = [];
  let current = "";

  for (let char of word) {
    current += char;

    if (vowels.includes(char)) {
      result.push(current);
      current = "";
    }
  }

  if (current.length > 0 && result.length > 0) {
    result[result.length - 1] += current;
  }

  return result;
}

function processText() {
  const text = document.getElementById("inputText").value.trim();

  syllables = splitWord(text);
  currentIndex = 0;

  render();
}

function render() {
  const container = document.getElementById("syllables");
  container.innerHTML = "";

  syllables.forEach((syl, index) => {

    const div = document.createElement("div");

    div.className = "syllable";

    if (index === currentIndex) {
      div.classList.add("active");
    }

    div.innerText = syl;

    div.onclick = () => {
      currentIndex = index;

      speak(syl);

      render();
    };

    container.appendChild(div);
  });
}

function speak(text) {
  const utterance = new SpeechSynthesisUtterance(text);

  utterance.lang = "it-IT";
  utterance.rate = 0.8;

  speechSynthesis.speak(utterance);
}

processText();
