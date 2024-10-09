import { useState } from 'react';
import ReactMarkdown from 'react-markdown';

export default function MarkdownEditor() {
    const [markdown, setMarkdown] = useState('type markdown here');

    const reverseSentence = (sentence) => {
        return sentence
            .split(' ')
            .reverse()
            .join(' ')
            .replace(/^\w/, (c) => c.toUpperCase());
    };

    const data = [
        { id: 1, name: 'Alice' },
        { id: 2, name: 'Bob' },
        { id: 3, name: 'Charlie' }
    ];

    const names = data.map(item => item.name);
    console.log(names); // ['Alice', 'Bob', 'Charlie']
    const namesString = names.join(', ');
    console.log(namesString); // 'Alice, Bob, Charlie'

    const handleChange = (event) => {
        setMarkdown(event.target.value);
    };

    return (
        <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', padding: '20px' }}>
            <textarea
                style={{ width: '80%', height: '200px', marginBottom: '20px' }}
                value={markdown}
                onChange={handleChange}
            />
            <div style={{ width: '80%', border: '1px solid #ddd', padding: '20px' }}>
                <ReactMarkdown>{markdown}</ReactMarkdown>
            </div>
        </div>
    );
}